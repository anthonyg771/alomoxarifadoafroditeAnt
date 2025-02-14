using AlmoxarifadoBackAPI.DTO;
using AlmoxarifadoBackAPI.Models;
using AlmoxarifadoBackAPI.Repositorio;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AlmoxarifadoBackAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class FornecedorController : ControllerBase
    {
        private readonly ICategoriaRepositorio _db;
        public FornecedorController(IFornecedorRepositorio db)
        {
            _db = db;

        }

        [HttpGet("/lista")]
        public IActionResult listaCategorias()
        {
            return Ok(_db.GetAll());
        }

        [HttpPost("/Produto")]
        public IActionResult listaProduto(CategoriaDTO Produto)
        {
            return Ok(_db.GetAll().Where(x => x.Codigo == Produto.Codigo));
        }

        [HttpPost("/criarProduto")]
        public IActionResult criarProduto(CategoriaCadastroDTO Produto)
        {

            var novaProduto = new Produto()
            {
                Descricao = Produto.Descricao
            };
            //_categorias.Add(novaCategoria);
            _db.Add(novaProduto);
            return Ok("Cadastro com Sucesso");
        }
    }
}