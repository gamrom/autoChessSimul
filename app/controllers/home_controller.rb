class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, :except => [:start, :index, :create]
  def index
    searchbyname = params[:searchbyname]
    searchbyjob = params[:searchbyjob]
    searchbyspecies = params[:searchbyspecies]

    #검색
    @charas = Chara.all
    if searchbyname.present?
      @charas = @charas.where(:name => searchbyname)
    end
    if searchbyjob.present?
      @charas = @charas.where(:job => searchbyjob)
    end
    if searchbyspecies.present?
      species1 = @charas.where(:species1 => searchbyspecies)
      species2 = @charas.where(:species2 => searchbyspecies)
      @charas = species1 + species2
    end

    @onboards = Onboard.all
    @jobarray = []
    @speciesarray = []

    if Onboard.count == 0
    end

    Onboard.count.times do |e|
      @jobarray.push(@onboards[e].job)
      @manyjob = @jobarray.uniq.compact #모든 직업을 중복없이
      @speciesarray.push(@onboards[e].species1)
      @speciesarray.push(@onboards[e].species2)
      @manyspecies = @speciesarray.uniq.compact #모든 종족을 중복없이
    end

  end

  def create

    idofclickbutton = params[:c_id].to_i
    charaset = Chara.find(idofclickbutton)
    temp = 0
    if Onboard.count == 0
      Onboard.create(name: charaset.name, job: charaset.job, species1: charaset.species1, species2: charaset.species2, howmany: 1)
    elsif Onboard.count != 0
      Onboard.count.times do |c|
        if Onboard.all[c].name == charaset.name
          temp += 1
          $whereis = c
        end
      end
      #개수가 0개면 새로 생성하고, 이미 생성되어있으면 개수(숫자)를 1씩 늘린다.
      if temp == 0
        Onboard.create(name: charaset.name, job: charaset.job, species1: charaset.species1, species2: charaset.species2, howmany: 1)
      elsif temp == 1
        Onboard.all[$whereis].increment(:howmany, 1).save
      end
    end

    redirect_to home_index_path
  end

  def destroy
    deleteboard = params[:deleteboard].to_i #deleteboard는 삭제할려는 온보드의 아이디번호 컬럼.
    #1이면 지우고, 1보다 많으면 개수(숫자)를 한개씩 줄인다.
    if Onboard.find(deleteboard).howmany == 1
      Onboard.find(deleteboard).destroy
    else
      Onboard.find(deleteboard).decrement(:howmany, 1).save
    end

    redirect_to home_index_path
  end

  def createmyCombination
    combination = Combination.create(user_id: current_user.id)
    combId = combination.id
    Onboard.count.times do |c|
      on = Onboard.all[c]
      Combinationarray.create(name: on.name, job: on.job, species1: on.species1, species2: on.species2, howmany: on.howmany, combination_id:  combId)
    end
    redirect_to home_index_path
  end

  def createmyCombinationPresent
    redirect_to home_index_path
  end

  def deleteCombination
    Onboard.destroy_all
    redirect_to home_mycomb_path
  end

  def mycomb
    @user = User.find(current_user.id)
    @combnum = Combination.count
    @combarraynum = Combinationarray.count

    hashspec = {}
    hashjob = {}
    @user.combinations.count.times do |u|
      spec = []
      job = []
      @user.combinations[u].combinationarrays.count.times do |l|
        temp = @user.combinations[u].combinationarrays[l].job
        job.push(temp)
        temp = @user.combinations[u].combinationarrays[l].species1
        spec.push(temp)
        temp = @user.combinations[u].combinationarrays[l].species2
        spec.push(temp)
      end
      hashspec[String(u)] = spec.compact
      hashjob[String(u)] = job.compact

    end

    #직업조합성공분류
    doublehashjob = {}

    hashjob.count.times do |h|
      temphashjob = {}
      uniqjob = hashjob[String(h)].uniq
      uniqjob.count.times do |u|
        tempnum = hashjob[String(h)].count(uniqjob[u])
        #스페셜리스트 -> 2, 4, 6
        if uniqjob[u] == "스페셜리스트"
          if tempnum >= 2 && tempnum < 4
            temphashjob["스페셜리스트"] = 2
          elsif tempnum >= 4 && tempnum <6
            temphashjob["스페셜리스트"] = 4
          elsif tempnum >= 6
            temphashjob["스페셜리스트"] = 6
          end
        end
        #가디언 -> 2, 4
        if uniqjob[u] == "가디언"
          if tempnum >= 2 && tempnum < 4
            temphashjob["가디언"] = 2
          elsif tempnum >= 4 && tempnum <6
            temphashjob["가디언"] = 4
          end
        end
        #블라스터 -> 3, 6
        if uniqjob[u] == "블라스터"
          if tempnum >= 3 && tempnum < 6
            temphashjob["블라스터"] = 3
          elsif tempnum >= 6
            temphashjob["블라스터"] = 6
          end
        end
        #어쌔신 -> 3, 6
        if uniqjob[u] == "어쌔신"
          if tempnum >= 3 && tempnum < 6
            temphashjob["어쌔신"] = 3
          elsif tempnum >= 6
            temphashjob["어쌔신"] = 6
          end
        end
        #지원가 -> 2, 4
        if uniqjob[u] == "지원가"
          if tempnum >= 2 && tempnum < 4
            temphashjob["지원가"] = 2
          elsif tempnum >= 4 && tempnum <6
            temphashjob["지원가"] = 4
          end
        end
        #롱샷 -> 3, 6
        if uniqjob[u] == "롱샷"
          if tempnum >= 3 && tempnum < 6
            temphashjob["롱샷"] = 3
          elsif tempnum >= 6
            temphashjob["롱샷"] = 6
          end
        end
        #시즈브레이커 -> 3, 6
        if uniqjob[u] == "시즈브레이커"
          if tempnum >= 3 && tempnum < 6
            temphashjob["시즈브레이커"] = 3
          elsif tempnum >= 6
            temphashjob["시즈브레이커"] = 6
          end
        end
        #서머너 -> 2
        if uniqjob[u] == "서머너"
          if tempnum >= 2
            temphashjob["서머너"] = 2
          end
        end
        #뱅가드 -> 3, 6, 9
        if uniqjob[u] == "뱅가드"
          if tempnum >= 3 && tempnum < 6
            temphashjob["뱅가드"] = 3
          elsif tempnum >= 6 && tempnum < 9
            temphashjob["뱅가드"] = 6
          elsif tempnum >= 9
            temphashjob["뱅가드"] = 9
          end
        end

        doublehashjob[h] = temphashjob
      end
      if temphashjob.empty?
        temphashjob["완성된조합"] = "없슴"
      end
      @showmycombjob = doublehashjob
    end

    doublehashspec = {}
    #종족조합성공분류
    hashspec.count.times do |h|
      temphashspec = {}
      uniqspec = hashspec[String(h)].uniq
      uniqspec.count.times do |u|
        tempnum = hashspec[String(h)].count(uniqspec[u])
        #마린 -> 2,4,6
        if uniqspec[u] == "마린"
          if tempnum >= 2 && tempnum < 4
            temphashspec["마린"] = 2
          elsif tempnum >= 4 && tempnum <6
            temphashspec["마린"] = 4
          elsif tempnum >= 6
            temphashspec["마린"] = 6
          end
        end
        #라이더 -> 2
        if uniqspec[u] == "라이더"
          if tempnum >= 2
            temphashspec["라이더"] = 2
          end
        end
        #메크 -> 2,4
        if uniqspec[u] == "메크"
          if tempnum >= 2 && tempnum < 4
            temphashspec["메크"] = 2
          elsif tempnum >= 4
            temphashspec["메크"] = 4
          end
        end
        #에어포스 -> 2,4
        if uniqspec[u] == "에어포스"
          if tempnum >= 2 && tempnum < 4
            temphashspec["에어포스"] = 2
          elsif tempnum >= 4
            temphashspec["에어포스"] = 4
          end
        end
        #퍼펫 -> 2,4, 6
        if uniqspec[u] == "퍼펫"
          if tempnum >= 2 && tempnum < 4
            temphashspec["퍼펫"] = 2
          elsif tempnum >= 4 && tempnum < 6
            temphashspec["퍼펫"] = 4
          elsif tempnum >= 6
            temphashspec["퍼펫"] = 6
          end
        end
        #사이커 -> 2,4
        if uniqspec[u] == "사이커"
          if tempnum >= 2 && tempnum < 4
            temphashspec["사이커"] = 2
          elsif tempnum >= 4
            temphashspec["사이커"] = 4
          end
        end
        #워커 -> 1
        if uniqspec[u] == "워커"
          if tempnum == 1
            temphashspec["워커"] = 1
          end
        end
        #크라켄 -> 2,4
        if uniqspec[u] == "크라켄"
          if tempnum >= 2 && tempnum < 4
            temphashspec["크라켄"] = 2
          elsif tempnum >= 4
            temphashspec["크라켄"] = 4
          end
        end
        #비스트 -> 2, 4, 6
        if uniqspec[u] == "비스트"
          if tempnum >= 2 && tempnum < 4
            temphashspec["비스트"] = 2
          elsif tempnum >= 4 && tempnum < 6
            temphashspec["비스트"] = 4
          elsif tempnum >= 6
            temphashspec = 6
          end
        end
        #랩터 -> 2,4
        if uniqspec[u] == "랩터"
          if tempnum >= 2 && tempnum < 4
            temphashspec["랩터"] = 2
          elsif tempnum >= 4
            temphashspec["랩터"] = 4
          end
        end
        #인섹토이드 -> 2,4
        if uniqspec[u] == "인섹토이드"
          if tempnum >= 2 && tempnum < 4
            temphashspec["인섹토이드"] = 2
          elsif tempnum >= 4
            temphashspec["인섹토이드"] = 4
          end
        end
        #이모탈 -> 2
        if uniqspec[u] == "이모탈"
          if tempnum >= 2
            temphashspec["이모탈"] = 2
          end
        end
        #판다 -> 3
        if uniqspec[u] == "판다"
          if tempnum == 3
            temphashspec["판다"] = 3
          end
        end

        doublehashspec[h] = temphashspec
      end
      if temphashspec.empty?
        temphashspec["완성된조합"] = "없슴"
      end
    end

    @showmycombspec = doublehashspec
  end

  def mycombdelete
    combid = params[:c_id]
    User.find(current_user.id).combinations.find(combid).destroy

    redirect_to home_mycomb_path
  end

end
