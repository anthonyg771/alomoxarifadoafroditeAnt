using AlmoxarifadoBackAPI.DTO;
using AlmoxarifadoBackAPI.Models;
using AlmoxarifadoBackAPI.Repositorio;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AlmoxarifadoBackAPI.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class EntradaController : ControllerBase
    {
        private readonly ICategoriaRepositorio _db;
        public EntradaController(IEntradaRepositorio db)
        {
            _db = db;

        }

        [HttpGet("/lista")]
        public IActionResult listaEntrada()
        {
            return Ok(_db.GetAll());
        }

        [HttpPost("/Entrada")]
        public IActionResult listaProduto(EntradaDTO Entrada)
        {
            return Ok(_db.GetAll().Where(x => x.Codigo == Entrada.Codigo));
        }

        [HttpPost("/criarEntrada")]
        public IActionResult criarEntrada(CategoriaCadastroDTO Entrada)
        {

            var novaEntrada = new Entrada()
            {
                Descricao = Entrada.Descricao
            };
            //_categorias.Add(novaCategoria);
            _db.Add(novaEntrada);
            return Ok("Cadastro com Sucesso");
        }
    }
}