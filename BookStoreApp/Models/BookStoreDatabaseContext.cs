using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace BookStoreApp.Models
{
    public partial class BookStoreDatabaseContext : DbContext
    {
       
        public BookStoreDatabaseContext()
        {
        }

        public BookStoreDatabaseContext(DbContextOptions<BookStoreDatabaseContext> options)
            : base(options)
        {

        }

        public virtual DbSet<Books> Books { get; set; }
        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Publishers> Publishers { get; set; }
        public virtual DbSet<Users> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=BookStoreDataContext");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Books>(entity =>
            {
                entity.HasIndex(e => e.PublisherId);

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Books)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_Books_Categories");

                entity.HasOne(d => d.Publisher)
                    .WithMany(p => p.Books)
                    .HasForeignKey(d => d.PublisherId);
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.Property(e => e.Fullname).IsRequired();

                entity.Property(e => e.Password).IsRequired();

                entity.Property(e => e.Username).IsRequired();
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
