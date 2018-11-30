using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace WebAPIHealth.Models.WebApiModels
{
    public partial class WebAPIContext : DbContext
    {
        public WebAPIContext()
        {
        }

        public WebAPIContext(DbContextOptions<WebAPIContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AllergieFiles> AllergieFiles { get; set; }
        public virtual DbSet<Allergies> Allergies { get; set; }
        public virtual DbSet<AllergiesPatient> AllergiesPatient { get; set; }
        public virtual DbSet<AspNetRoles> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaims> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogins> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUserRoles> AspNetUserRoles { get; set; }
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }
        public virtual DbSet<HealthCheck> HealthCheck { get; set; }
        public virtual DbSet<OrderTypes> OrderTypes { get; set; }
        public virtual DbSet<Priorities> Priorities { get; set; }
        public virtual DbSet<ProcedureBodySites> ProcedureBodySites { get; set; }
        public virtual DbSet<ProcedureLateralities> ProcedureLateralities { get; set; }
        public virtual DbSet<ProcedureOrder> ProcedureOrder { get; set; }
        public virtual DbSet<ProcedureOrderCode> ProcedureOrderCode { get; set; }
        public virtual DbSet<ProcedureProviders> ProcedureProviders { get; set; }
        public virtual DbSet<ProcedureReport> ProcedureReport { get; set; }
        public virtual DbSet<ProcedureReportStatuses> ProcedureReportStatuses { get; set; }
        public virtual DbSet<ProcedureResult> ProcedureResult { get; set; }
        public virtual DbSet<ProcedureResultAbnormal> ProcedureResultAbnormal { get; set; }
        public virtual DbSet<ProcedureRoutes> ProcedureRoutes { get; set; }
        public virtual DbSet<ProcedureType> ProcedureType { get; set; }
        public virtual DbSet<ProcedureTypes> ProcedureTypes { get; set; }
        public virtual DbSet<ProcedureUnits> ProcedureUnits { get; set; }
        public virtual DbSet<Specimens> Specimens { get; set; }
        public virtual DbSet<Statuses> Statuses { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserToUserRelation> UserToUserRelation { get; set; }
        public virtual DbSet<UserToUserRelationTypes> UserToUserRelationTypes { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=DFX-NB-P50-A22\\SQLEXPRESS;Database=WebAPI;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.0-preview3-35497");

            modelBuilder.Entity<AllergieFiles>(entity =>
            {
                entity.Property(e => e.Id).HasDefaultValueSql("(newid())");

                entity.Property(e => e.CreatedOn).HasColumnType("datetime");

                entity.Property(e => e.FileName)
                    .IsRequired()
                    .HasMaxLength(256);

                entity.Property(e => e.Mime)
                    .IsRequired()
                    .HasMaxLength(256);

                entity.Property(e => e.OwnedBy)
                    .IsRequired()
                    .HasMaxLength(256)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Allergies>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.AllergyName)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.AllergyType)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Summary)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<AllergiesPatient>(entity =>
            {
                entity.Property(e => e.Id).HasDefaultValueSql("(newid())");

                entity.Property(e => e.BeginDate).HasColumnType("datetime");

                entity.Property(e => e.CreateDate).HasColumnType("datetime");

                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.Location)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Reaction)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Severity)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.UpdateDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<AspNetRoles>(entity =>
            {
                entity.HasIndex(e => e.Name)
                    .HasName("RoleNameIndex")
                    .IsUnique();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(256);
            });

            modelBuilder.Entity<AspNetUserClaims>(entity =>
            {
                entity.HasIndex(e => e.UserId)
                    .HasName("IX_UserId");

                entity.Property(e => e.UserId)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserClaims)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId");
            });

            modelBuilder.Entity<AspNetUserLogins>(entity =>
            {
                entity.HasKey(e => new { e.LoginProvider, e.ProviderKey, e.UserId })
                    .HasName("PK_dbo.AspNetUserLogins");

                entity.HasIndex(e => e.UserId)
                    .HasName("IX_UserId");

                entity.Property(e => e.LoginProvider).HasMaxLength(128);

                entity.Property(e => e.ProviderKey).HasMaxLength(128);

                entity.Property(e => e.UserId).HasMaxLength(128);

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserLogins)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId");
            });

            modelBuilder.Entity<AspNetUserRoles>(entity =>
            {
                entity.HasKey(e => new { e.UserId, e.RoleId })
                    .HasName("PK_dbo.AspNetUserRoles");

                entity.HasIndex(e => e.RoleId)
                    .HasName("IX_RoleId");

                entity.HasIndex(e => e.UserId)
                    .HasName("IX_UserId");

                entity.Property(e => e.UserId).HasMaxLength(128);

                entity.Property(e => e.RoleId).HasMaxLength(128);

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.AspNetUserRoles)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.AspNetUserRoles)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId");
            });

            modelBuilder.Entity<AspNetUsers>(entity =>
            {
                entity.HasIndex(e => e.UserName)
                    .HasName("UserNameIndex")
                    .IsUnique();

                entity.Property(e => e.Id)
                    .HasMaxLength(128)
                    .ValueGeneratedNever();

                entity.Property(e => e.Email).HasMaxLength(256);

                entity.Property(e => e.LockoutEndDateUtc).HasColumnType("datetime");

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .HasMaxLength(256);
            });

            modelBuilder.Entity<HealthCheck>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<OrderTypes>(entity =>
            {
                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.OrderType)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Priorities>(entity =>
            {
                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Priority)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureBodySites>(entity =>
            {
                entity.Property(e => e.BodySite)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureLateralities>(entity =>
            {
                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Laterality)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureOrder>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ClinicalHx)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ControlId)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.DateCollected).HasColumnType("datetime");

                entity.Property(e => e.DateOrdered).HasColumnType("date");

                entity.Property(e => e.DateTransmitted).HasColumnType("datetime");

                entity.Property(e => e.PatientInstructions)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.SpecimenLocation)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.SpecimenVolume)
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureOrderCode>(entity =>
            {
                entity.HasKey(e => e.ProcedureOrderId);

                entity.Property(e => e.ProcedureOrderId).ValueGeneratedNever();

                entity.Property(e => e.Diagnoses)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ProcedureOrderTitle)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ProcedureSource)
                    .HasMaxLength(1)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureProviders>(entity =>
            {
                entity.HasKey(e => e.Ppid);

                entity.Property(e => e.Direction)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.FullName)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Notes)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Npi)
                    .IsRequired()
                    .HasColumnName("NPI")
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.OrdersPath)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Protocol)
                    .IsRequired()
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.RecvAppId)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.RecvFacId)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.RemoteHost)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ResultsPath)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.SendAppId)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.SendFacId)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureReport>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.DateCollected).HasColumnType("datetime");

                entity.Property(e => e.DateCollectedTz)
                    .HasColumnName("DateCollectedTZ")
                    .HasMaxLength(5)
                    .IsUnicode(false);

                entity.Property(e => e.DateReport).HasColumnType("datetime");

                entity.Property(e => e.DateReportTz)
                    .HasColumnName("DateReportTZ")
                    .HasMaxLength(5)
                    .IsUnicode(false);

                entity.Property(e => e.ReportNotes)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureReportStatuses>(entity =>
            {
                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ReportStatus)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureResult>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Comments)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Facility)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Range)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Result)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ResultCode)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ResultDataType)
                    .IsRequired()
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.ResultDate).HasColumnType("datetime");

                entity.Property(e => e.ResultText)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureResultAbnormal>(entity =>
            {
                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ResultAbnormal)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureRoutes>(entity =>
            {
                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Route)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureType>(entity =>
            {
                entity.Property(e => e.BodySite)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Laterality)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Notes)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.ProcedureCode)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.ProcedureType1).HasColumnName("ProcedureType");

                entity.Property(e => e.Range)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.RelatedCode)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.StandardCode)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureTypes>(entity =>
            {
                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Type)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<ProcedureUnits>(entity =>
            {
                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Unit)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Specimens>(entity =>
            {
                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Specimen)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Statuses>(entity =>
            {
                entity.Property(e => e.Description)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.City)
                    .HasMaxLength(35)
                    .IsUnicode(false);

                entity.Property(e => e.Created).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.CredentialsId)
                    .IsRequired()
                    .HasMaxLength(128);

                entity.Property(e => e.Dob)
                    .HasColumnName("DOB")
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .HasMaxLength(80)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName).HasMaxLength(35);

                entity.Property(e => e.Gender)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasDefaultValueSql("('U')");

                entity.Property(e => e.LastModified).HasDefaultValueSql("(getdate())");

                entity.Property(e => e.LastName).HasMaxLength(35);

                entity.Property(e => e.MiddleName).HasMaxLength(35);

                entity.Property(e => e.Notes)
                    .HasMaxLength(1000)
                    .IsUnicode(false);

                entity.Property(e => e.Phone)
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.Phone2)
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.Phone3)
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneType)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.State)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Street)
                    .HasMaxLength(35)
                    .IsUnicode(false);

                entity.Property(e => e.Street2)
                    .HasMaxLength(35)
                    .IsUnicode(false);

                entity.Property(e => e.Zip)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.HasOne(d => d.Credentials)
                    .WithMany(p => p.User)
                    .HasForeignKey(d => d.CredentialsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_User_AspNetUsers");
            });

            modelBuilder.Entity<UserToUserRelation>(entity =>
            {
                entity.HasKey(e => new { e.UserA, e.UserB });
            });

            modelBuilder.Entity<UserToUserRelationTypes>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.RelationDescription)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.RelationType)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });
        }
    }
}
