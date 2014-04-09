class QuestionsController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    @section = Section.find(params[:section_id])
    @questions = @section.questions

  end

  # GET /questions/1
  # GET /questions/1.json
  def show
 
    @section = Section.find(params[:section_id])
    @question = @section.questions.find(params[:id])
    @input1 = params[:submit_tag]
    @vote = Vote.runcheck(@input1)
    @question.score = @question.score + @vote
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @section = Section.find(params[:section_id])
    @question = @section.questions.build

  end

  # GET /questions/1/edit
  def edit
    @section = Section.find(params[:section_id])
    @question = @section.questions.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
   def create
    @section = Section.find(params[:section_id])
    @question = @section.questions.build(params[:question])
    if @question.save
      redirect_to section_question_url(@section, @question)
    else
      render :action => "new"
    end
  end
  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @section = Section.find(params[:section_id])
    @question = Question.find(params[:question])
    if @item.update_attributes(params[:question])
      redirect_to section_question_url(@section, @question)
    else
      render :action=>"edit"
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @section = Section.find(params[:section_id])
    @question = Question.find(params[:id])
    @question.destroy
    
    respond_to do |format|
      format.html { redirect_to section_questions_path(@section) }
      format.xml { head :ok }
    end
  end
end