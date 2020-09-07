using BookStoreApp.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;

namespace BookStoreApp.Handlers
{
    public class BasicAuthenticationHandler : AuthenticationHandler<AuthenticationSchemeOptions>
    {
        private readonly BookStoreDatabaseContext _db;
        public BasicAuthenticationHandler(
                   IOptionsMonitor<AuthenticationSchemeOptions> optionsMonitor,
                   ILoggerFactory loggerFactory,
                   UrlEncoder urlEncoder,
                   ISystemClock systemClock,
                    BookStoreDatabaseContext db
            ) : base(optionsMonitor, loggerFactory, urlEncoder, systemClock)
        {
            _db = db;
        }

        protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
        {


            if (!Request.Headers.ContainsKey("Authentication"))
                return AuthenticateResult.Fail("Need to Authorize");
            try
            {
                var value = AuthenticationHeaderValue.Parse(Request.Headers["Authentication"]);
                var bytes = Convert.FromBase64String(value.Parameter);
                var crendentials = Encoding.UTF8.GetString(bytes).Split(":");
                var username = crendentials[0];
                var password = crendentials[1];

                var user = _db.Users.FirstOrDefault(u => u.Username.Equals(username) && u.Password == password);
                if (user == null)
                {
                    return AuthenticateResult.Fail("Invalid User/Password");

                }

                var claims = new[] { new Claim(ClaimTypes.Name, username) };
                var identity = new ClaimsIdentity(claims, Scheme.Name);
                var principal = new ClaimsPrincipal(identity);
                var ticket = new AuthenticationTicket(principal, Scheme.Name);

                return AuthenticateResult.Success(ticket);


            }
            catch
            {

                return AuthenticateResult.Fail("Ooops");

            }

        }
    }
}
