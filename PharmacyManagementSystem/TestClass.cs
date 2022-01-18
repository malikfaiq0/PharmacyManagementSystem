using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium;
using NUnit.Framework;


namespace PharmacyManagementSystem
{

    public class TestClass
    {
        [Test]
        public void testCase01()
        {
            IWebDriver driver = new ChromeDriver();
            driver.Manage().Window.Maximize();
            driver.Url = "https://localhost:44366/";
            driver.FindElement(By.Id("username")).SendKeys("Malik");
            driver.FindElement(By.Id("password")).SendKeys("malik");
            driver.FindElement(By.Id("login")).Click();
            driver.Close();

        }
    }
}