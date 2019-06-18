class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    searchbyname = params[:searchbyname]
    searchbyjob = params[:searchbyjob]
    searchbyspecies = params[:searchbyspecies]


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

end
