var builder = WebApplication.CreateBuilder(args);

builder = builder.UseWasiConnectionListener();

// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
// if (!app.Environment.IsDevelopment())
// {
//     app.UseExceptionHandler("/Home/Error");
// }

app.UseStaticFiles();
app.UseBundledStaticFiles();

app.UseRouting();
app.MapControllers();

// app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
