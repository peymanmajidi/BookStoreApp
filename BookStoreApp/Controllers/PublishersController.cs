using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using BookStoreApp.Models;
using Microsoft.AspNetCore.Authorization;

namespace BookStoreApp.Controllers
{

  
    [Route("api/[controller]")]
    [ApiController]
    public class PublishersController : ControllerBase
    {
        private readonly BookStoreDatabaseContext _db;

        public PublishersController(BookStoreDatabaseContext db)
        {
            _db = db;
        }

        // GET: api/Publishers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Publishers>>> GetPublishers()
        {
            return await _db.Publishers.ToListAsync();
        }

        // GET: api/Publishers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Publishers>> GetPublishers(int id)
        {
            var publishers = await _db.Publishers.FindAsync(id);

            if (publishers == null)
            {
                return NotFound();
            }

            return publishers;
        }

        // PUT: api/Publishers/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPublishers(int id, Publishers publishers)
        {
            if (id != publishers.Id)
            {
                return BadRequest();
            }

            _db.Entry(publishers).State = EntityState.Modified;

            try
            {
                await _db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PublishersExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Content("done");
        }

        // POST: api/Publishers
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Publishers>> PostPublishers(Publishers publishers)
        {
            _db.Publishers.Add(publishers);
            await _db.SaveChangesAsync();

            return CreatedAtAction("GetPublishers", new { id = publishers.Id }, publishers);
        }

        // DELETE: api/Publishers/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Publishers>> DeletePublishers(int id)
        {
            var publishers = await _db.Publishers.FindAsync(id);
            if (publishers == null)
            {
                return NotFound();
            }

            _db.Publishers.Remove(publishers);
            await _db.SaveChangesAsync();

            return publishers;
        }

        private bool PublishersExists(int id)
        {
            return _db.Publishers.Any(e => e.Id == id);
        }
    }
}
