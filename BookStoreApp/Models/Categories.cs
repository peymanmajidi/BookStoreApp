using System;
using System.Collections.Generic;

namespace BookStoreApp.Models
{
    public partial class Categories
    {
        public Categories()
        {
            Books = new HashSet<Books>();
        }

        public int Id { get; set; }
        public string Title { get; set; }

        public virtual ICollection<Books> Books { get; set; }
    }
}
