using System;
using System.Collections.Generic;

namespace BookStoreApp.Models
{
    public partial class Books
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int Page { get; set; }
        public int? PublisherId { get; set; }
        public int? CategoryId { get; set; }

        public virtual Categories Category { get; set; }
        public virtual Publishers Publisher { get; set; }
    }
}
