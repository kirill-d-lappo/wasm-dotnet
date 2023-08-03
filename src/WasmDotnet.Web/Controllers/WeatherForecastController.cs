using Microsoft.AspNetCore.Mvc;
using WasmDotnet.Web.Models;

namespace WasmDotnet.Web.Controllers;

[ApiController]
[Route("[controller]")]
public class WeatherForecastController : ControllerBase
{
    private static readonly string[] Summaries = new[]
    {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

    private readonly ILogger<WeatherForecastController> _logger;

    public WeatherForecastController(ILogger<WeatherForecastController> logger)
    {
        _logger = logger;
    }

    [HttpGet]
    public async Task<IEnumerable<WeatherForecast>> GetAsync()
    {
        var forecast = await GetWeatherForecasts();

        // doesnt work, waits indefinitely
        // await Task.Delay(5000);

        await Task.Run(() => Thread.Sleep(5000));

        _logger.LogInformation("Forecasts found: {Count}", forecast.Length);

        return forecast;
    }

    private async Task<WeatherForecast[]> GetWeatherForecasts()
    {
        var rng = new Random();

        var forecast = Enumerable
            .Range(1, 5)
            .Select(index => new WeatherForecast
            {
                Date         = DateTime.Now.AddDays(index),
                TemperatureC = rng.Next(-20, 55),
                Summary      = Summaries[rng.Next(Summaries.Length)]
            })
            .ToArray();

        return forecast;
    }
}
