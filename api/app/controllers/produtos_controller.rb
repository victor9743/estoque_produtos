class ProdutosController < ApplicationController
    def index
        begin
            @produto = Produto.all
            render json: @produto, status: :ok
        rescue ActiveRecord::RecordNotFound => e
            render json: { error: e.message }, status: :not_found
        rescue StandardError => e
            render json: { error: e.message }, status: :internal_server_error
        end
    end

    def show
        begin
            @produto = Produto.find(params[:id])
            
            render json: @produto, status: :ok
        rescue ActiveRecord::RecordNotFound => e
            render json: { error: e.message }, status: :not_found
        rescue StandardError => e
            render json: { error: e.message }, status: :internal_server_error
        end
    end

    def create
        @produto = Produto.new({
            "nome" => params[:nome],
            "descricao" => params[:descricao],
            "preco" => params[:preco].to_i,
            "quantidade" => params[:quantidade].to_i
        })

        if @produto.save
          render json: @produto, status: :created
        else
          render json: @produto.errors, status: :unprocessable_entity
        end
    end

    def update
        @produto = Produto.find(params[:id])

        if @produto.update({
            "nome" => params[:nome],
            "descricao" => params[:descricao],
            "preco" => params[:preco].to_i,
            "quantidade" => params[:quantidade].to_i
        })

          render json: @produto
        else
          render json: @produto.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @produto = Produto.find(params[:id])
        
        if @produto.destroy
            head :no_content
        else
            render json: @produto.errors, status: :unprocessable_entity
        end
    end
    
end
