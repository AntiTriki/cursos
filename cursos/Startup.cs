using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(cursos.Startup))]
namespace cursos
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
