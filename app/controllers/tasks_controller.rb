class TasksController < ApplicationController
    def index
        @tasks = Task.all
      end

      def show
        @task = Task.find(params[:id])
      end

      def new
        @task = Task.new
      end

      def create
        @task = Task.new(task_params)
         if @task.save
          flash[:notice] = "スケジュールが新規登録されました"
           redirect_to :tasks
         else
           render "new"
         end
       end

      def edit
        @task = Task.find(params[:id])
      end

      def update
        @task = Task.find(params[:id])
         if @task.update (task_params)
          flash[:notice] = "スケジュールを更新しました"
           redirect_to :tasks
         else
           render "new"
         end
      end

      def destroy
        @task = Task.find(params[:id])
        @task.destroy
        flash[:notice] = "スケジュールを削除しました"
        redirect_to :tasks
      end

      private

      def task_params
        params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo)

    end
end
