class SubTagsController < ApplicationController
  def new
    @sub_tags = SubTag.all
  	@sub_tag = SubTag.new
  end

  def create
  	@sub_tag = SubTag.new(sub_tag_params)
  	if @sub_tag.save
  		redirect_to root_path
  	else
  		redirect_to new_sub_tag_path
  	end
  end

  def index
  	@sub_tags = SubTag.all
  end

  def destroy
  end

  def edit
    @sub_tags = SubTag.all
  	@sub_tag = SubTag.find(params[:id])
  end

  def update
  	@sub_tag = SubTag.find(params[:id])
  	@sub_tag.update(sub_tag_params)
    if @sub_tag.save
  		redirect_to root_path
  	else
  		redirect_to  edit_sub_tag_path
  	end	
  end

  private

	  def sub_tag_params
	  	params.require(:sub_tag).permit(
	        :sub_tag_name,
	        :sub_tag_detail
	        )
	  end
end
