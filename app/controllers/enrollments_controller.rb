class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[show edit update destroy]
  before_action :auth, :admin?

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        flash[:success] = 'Enrollment was successfully created.'
        format.html { redirect_to "/students/#{@enrollment.student_id}" }
      end
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        flash[:success] = 'Enrollment was successfully updated.'
        format.html { redirect_to "/students/#{@enrollment.student_id}" }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    @enrollment.destroy
    respond_to do |format|
      flash[:success] = 'Enrollment was successfully destroyed.'
      format.html { redirect_to "/students/#{@enrollment.student_id}" }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def enrollment_params
    params.require(:enrollment).permit(:result, :student_id, :cell_id)
  end
end