require 'rqrcode'

class BoxesController < ApplicationController
  
  before_action :set_box, only: %i[ show edit update destroy ]
  
  
  # GET /boxes or /boxes.json
  def index
    @boxes = Box.all
  end

  # GET /boxes/1 or /boxes/1.json
  def show
  end

  # GET /boxes/new
  def new
    @box = Box.new
  end

  # GET /boxes/1/edit
  def edit
  end
  # POST /boxes or /boxes.json
  def create
    unless box_check
      @box = Box.new(box_params)
      respond_to do |format|
      if @box.save 
        qrcode = RQRCode::QRCode.new("#{request.url}/#{@box.id}")
        svg = qrcode.as_svg(
          offset: 0,
          color: '001',
          shape_rendering: 'crispEdges',
          module_size: 3,
          standalone: true
        )
         @box.update(code: svg)
          format.html { redirect_to @box, notice: "Box was successfully created." }
          format.json { render :show, status: :created, location: @box }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @box.errors, status: :unprocessable_entity }
        end
      end
    else
        redirect_to boxes_path ,notice: "You need update your plan for create more boxes"
    end
  end

  # PATCH/PUT /boxes/1 or /boxes/1.json
  def update
    respond_to do |format|
      if @box.update(box_params)
        format.html { redirect_to @box, notice: "Box was successfully updated." }
        format.json { render :show, status: :ok, location: @box }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boxes/1 or /boxes/1.json
  def destroy
    @box.destroy
    respond_to do |format|
      format.html { redirect_to boxes_url, notice: "Box was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_box
      begin
        @box = Box.find(params[:id])
      rescue
        format.html { redirect_to boxes_url, notice: "You dont have this box" }
      end
    end

    # Only allow a list of trusted parameters through.
    def box_params
      params.require(:box).permit( :description)
    end

    def box_check
      current_tenant = ActsAsTenant.current_tenant 
      if current_tenant.plan  == "free"
          current_tenant.boxes.count >= 1
          
      elsif current_tenant.plan  == "moderate"
          current_tenant.boxes.count >= 5

      else current_tenant.plan  == "unlimitess"
        false
      end
  end  
end
