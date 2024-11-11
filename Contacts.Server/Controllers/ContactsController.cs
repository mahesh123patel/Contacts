    using Microsoft.AspNetCore.Mvc;

    using Contacts.Server.Modles;
    using Microsoft.AspNetCore.Mvc;
    using System.Collections.Generic;
    using Contacts.Server.Services;

namespace Contacts.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactsController : ControllerBase
    {
        private readonly ContactService _contactService;

        public ContactsController(ContactService contactService)
        {
            _contactService = contactService;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Contact>> GetContacts()
        {
            return _contactService.GetContacts();
        }

        [HttpGet("{id}")]
        public ActionResult<Contact> GetContact(int id)
        {
            var contact = _contactService.GetContact(id);
            if (contact == null)
            {
                return NotFound();
            }
            return contact;
        }

        [HttpPost]
        public ActionResult<Contact> CreateContact(Contact contact)
        {
            var createdContact = _contactService.CreateContact(contact);
            return CreatedAtAction(nameof(GetContact), new { id = createdContact.Id }, createdContact);
        }

        [HttpPut("{id}")]
        public IActionResult UpdateContact(int id, Contact contact)
        {
            if (id != contact.Id)
            {
                return BadRequest();
            }

            var updatedContact = _contactService.UpdateContact(contact);
            if (updatedContact == null)
            {
                return NotFound();
            }

            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteContact(int id)
        {
            var contact = _contactService.GetContact(id);
            if (contact == null)
            {
                return NotFound();
            }

            _contactService.DeleteContact(id);
            return NoContent();
        }
    }
}