class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweets = Tweet.new
  end
  
  def create
    @tweets = Tweet.new(message: params[:tweet][:message],tdate: Time.current)
    if @tweets.save
      flash[:notice] = '投稿しました'
      redirect_to '/'
    else
      flash[:blankalert] = 'エラー：1文字以上140文字以内の本文を入力してください'
      render 'new'
    end
    @tweets.save
  end
  
  def destroy
    @tweets = Tweet.find(params[:id])
    @tweets.destroy
    flash[:notice] = '削除しました'
    redirect_to '/'
  end
  
  def show
    @tweets = Tweet.find(params[:id])
  end
  
  def edit
    @tweets = Tweet.find(params[:id])
  end
  
  def update
    @tweets = Tweet.find(params[:id])
    @tweets.update(message: params[:tweet][:message],tdate: Time.current)
    if @tweets.save
      flash[:notice] = "更新しました"
    redirect_to '/'
    else
      flash[:blankalert] = "1文字以上140文字以内のメッセージを入力してください"
      render 'edit'
    end
  end
end