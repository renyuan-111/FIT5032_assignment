using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Assignment_Proejct.Startup))]
namespace Assignment_Proejct
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
