namespace Contacts.Server.Services
{
    using Contacts.Server.Modles;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Text.Json;

        public class ContactService
        {
            private readonly string _dataFile = "contacts.json";

            public List<Contact> GetContacts()
            {
                if (!File.Exists(_dataFile))
                {
                    return new List<Contact>();
                }

                var json = File.ReadAllText(_dataFile);
                return JsonSerializer.Deserialize<List<Contact>>(json);
            }

            public Contact GetContact(int id)
            {
                var contacts = GetContacts();
                return contacts.FirstOrDefault(c => c.Id == id);
            }

            public Contact CreateContact(Contact contact)
            {
                var contacts = GetContacts();
                contact.Id = contacts.Count > 0 ? contacts.Max(c => c.Id) + 1 : 1;
                contacts.Add(contact);
                SaveContacts(contacts);
                return contact;
            }

            public Contact UpdateContact(Contact contact)
            {
                var contacts = GetContacts();
                var existingContact = contacts.FirstOrDefault(c => c.Id == contact.Id);
                if (existingContact != null)
                {
                    existingContact.FirstName = contact.FirstName;
                    existingContact.LastName = contact.LastName;
                    existingContact.Email = contact.Email;
                    SaveContacts(contacts);
                }
                return existingContact;
            }

            public void DeleteContact(int id)
            {
                var contacts = GetContacts();
                contacts.RemoveAll(c => c.Id == id);
                SaveContacts(contacts);
            }

            private void SaveContacts(List<Contact> contacts)
            {
                var json = JsonSerializer.Serialize(contacts);
                File.WriteAllText(_dataFile, json);
            }
        }
    }
