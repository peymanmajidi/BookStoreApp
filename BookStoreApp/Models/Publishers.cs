using System;
using System.Collections.Generic;

namespace BookStoreApp.Models
{
    public partial class Publishers
    {
        public Publishers()
        {
            Books = new HashSet<Books>();
        }

        public int Id { get; set; }
        public string Title { get; set; }
        public string Address { get; set; }
        public string Telephone { get; set; }

        public virtual ICollection<Books> Books { get; set; }
    }
}
