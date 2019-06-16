class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    searchbyname = params[:searchbyname]
    searchbyjob = params[:searchbyjob]
    searchbyspecies = params[:searchbyspecies]
    # @name = Chara.where(name = @searchbyname).all
    # @job = Chara.where(name = @searchbyjob).all
    # @species = Chara.where(name = @searchbyspecies).all

    @charas = Chara.all
    if searchbyname.present?
      @charas = Chara.where(:name => searchbyname)
    end
    if searchbyjob.present?
      @charas = Chara.where(:job => searchbyjob)
    end
    if searchbyspecies.present?
      @charas = Chara.where(:species1 => searchbyspecies)
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

      if temp == 0
        Onboard.create(name: charaset.name, job: charaset.job, species1: charaset.species1, species2: charaset.species2, howmany: 1)
      elsif temp == 1
        Onboard.all[$whereis].increment(:howmany, 1).save
      end
    end

    redirect_to :root
  end

  def destroy
    deleteboard = params[:deleteboard].to_i #deleteboard는 삭제할려는 온보드의 아이디번호 컬럼.
    if Onboard.find(deleteboard).howmany == 1
      Onboard.find(deleteboard).destroy
    else
      Onboard.find(deleteboard).decrement(:howmany, 1).save
    end


    redirect_to :root

  end

end
