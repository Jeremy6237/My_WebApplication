using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyWebApplication.Controllers
{
    public class ExecutionController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [ApiController]
        [Route("api/[controller]")]
        public class Myoffice_ACPDController : ControllerBase
        {
            private readonly IConfiguration _configuration;

            public Myoffice_ACPDController(IConfiguration configuration)
            {
                _configuration = configuration;
            }

            [HttpPost("create")]
            public async Task<IActionResult> Create([FromBody] JObject jsonData)
            {
                using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                    var result = await connection.ExecuteAsync("usp_CreateMyoffice_ACPD", new { JsonData = jsonData.ToString() }, commandType: CommandType.StoredProcedure);
                    return Ok(result);
                }
            }

            [HttpGet("read")]
            public async Task<IActionResult> Read()
            {
                using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                    var result = await connection.QueryAsync("usp_ReadMyoffice_ACPD", commandType: CommandType.StoredProcedure);
                    return Ok(result);
                }
            }

            [HttpPut("update")]
            public async Task<IActionResult> Update([FromBody] JObject jsonData)
            {
                using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                    var result = await connection.ExecuteAsync("usp_UpdateMyoffice_ACPD", new { JsonData = jsonData.ToString() }, commandType: CommandType.StoredProcedure);
                    return Ok(result);
                }
            }

            [HttpDelete("delete")]
            public async Task<IActionResult> Delete([FromBody] JObject jsonData)
            {
                using (var connection = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                    var result = await connection.ExecuteAsync("usp_DeleteMyoffice_ACPD", new { JsonData = jsonData.ToString() }, commandType: CommandType.StoredProcedure);
                    return Ok(result);
                }
            }
        }

    }
}
