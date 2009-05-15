class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.xml
  require 'rss/1.0'
  require 'rss/2.0'
  require 'open-uri'
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end
  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    case params[:type_of]
      when "TwitterAccount"
        create_twitter_account(params[:account][:username])
      when "RssAccount"
        create_rss_account(params[:account][:url])
      when "IcalAccount"
        create_ical_account(params[:account][:url])
      else
        redirect_to :controller => :accounts, :action => :new
      end
  end
  def create_twitter_account(account_username)
    @account = TwitterAccount.new()
    @account.username = account_username
    @account.user_id = current_user.id
    respond_to do |format|
      if @account.save
        flash[:notice] = 'Account was successfully created.'
        format.html { redirect_to :controller => :accounts , :action => :check_for_updates}
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end
  def create_rss_account(account_url)
    @account = RssAccount.new()
    @account.url = account_url
    @account.user_id = current_user.id
    respond_to do |format|
      if @account.save
        flash[:notice] = 'Account was successfully created.'
        format.html { redirect_to :controller => :accounts , :action => :check_for_updates}
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end
  def create_ical_account(account_url)
    @account = IcalAccount.new()
    @account.url = account_url
    @account.user_id = current_user.id
    respond_to do |format|
      if @account.save
        flash[:notice] = 'Account was successfully created.'
        format.html { redirect_to :controller => :accounts , :action => :check_for_updates}
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end
  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        flash[:notice] = 'Account was successfully updated.'
        format.html { redirect_to(@account) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end
  def check_for_updates
    @accounts = Account.all
    @accounts.each do |account|
      if account.get_content(account,10)
        flash[:notice] = 'Accounts updated'
      else
        flash[:error] = 'Exploding account, probably bad username'
      end
    end
    redirect_to root_path
  end
end
