class AnswersController < ApplicationController
  # GET /questions
  # GET /questions.json
  def index
    @section = Section.find(params[:section_id])
    @question = Question.find(params[:question_id])
    @answers = @question.answers

  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @section = Section.find(params[:section_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @input1 = params[:submit_tag]
    @vote = Vote.runcheck(@input1)
    @answer.score = @answer.score + @vote
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @section = Section.find(params[:section_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build

  end

  # GET /questions/1/edit
  def edit
    @section = Section.find(params[:section_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
   def create
    @section = Section.find(params[:section_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(params[:answer])
    if @answer.save
      redirect_to question_answer_url(@question, @answer)
    else
      render :action => "new"
    end
  end
  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @section = Section.find(params[:section_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to question_answer_url(@question, @answer)
    else
      render :action=>"edit"
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @section = Section.find(params[:section_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    
    respond_to do |format|
      format.html { redirect_to question_answers_path(@question) }
      format.xml { head :ok }
    end
  end
end