using Search;
using System;

using System.Web.Mvc;
using MathWorks.MATLAB.NET.Arrays;
using System.Collections.Generic;
using System.Web;
using System.Drawing;
using System.IO;

namespace VRA_final.Controllers
{
    public class HomeController : Controller
    {
        static string if_weight = "tfidf";
        static string if_norm = "l2";
        static string if_dist = "l2";
        static int nWords = 50000;
        static string datasetDir = "";
        static string featurePath = "";
        static string infoPath = "";
        static string dictPath = "";
        static string wordsPath = "";
        static MWArray files = null;
        static MWArray dict = null;
        static MWArray dict_words = null;
        static MWArray inv_file = null;
        static int _numInter = 100;
        static int _numTree = 8;
        static int _nTop = 1000;
        public HomeController()
        {
            var serverPath = HttpRuntime.AppDomainAppPath;
            datasetDir = Path.Combine(serverPath, @"oxford\images\");
            featurePath = Path.Combine(serverPath, @"oxford\feat\feature.bin");
            infoPath = Path.Combine(serverPath, @"oxford\feat\feat_info.mat");
            dictPath = Path.Combine(serverPath, @"oxford\feat\dict.mat");
            wordsPath = Path.Combine(serverPath, @"oxford\feat\words.mat");
            try
            {
                if (dict_words == null || dict == null || inv_file == null)
                {

                    VIR obj = new VIR();
                    var words = obj.LoadWords(wordsPath);
                    dict_words = obj.LoadDict(dictPath);
                    dict = obj.ComputeDict(dict_words, _numInter, num_trees: _numTree);
                    files = obj.LoadFiles(infoPath);
                    if (inv_file == null)
                        inv_file = obj.CreateInvertedFile(words: words, nWords: nWords, if_weight: if_weight, if_norm: if_norm);

                }
            }
            catch (Exception e)
            {
                throw;
            }
        }
        public ActionResult Index()
        {
            var output = new string[0];
            try
            {

            }
            catch (Exception e)
            {
                throw;
            }
            return View(output);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public JsonResult Search()
        {
            var output = new string[0];
            var fileContent = Request.Files[0];
            if (fileContent != null && fileContent.ContentLength > 0)
            {
                var buffer = new byte[fileContent.ContentLength];
                var stream = fileContent.InputStream;
                var data = stream.Read(buffer, 0, buffer.Length);
                var img = Image.FromStream(stream);
                var serverPath = HttpRuntime.AppDomainAppPath;
                var temp = Path.Combine(serverPath, @"temp\");
                if (!Directory.Exists(temp))
                {
                    Directory.CreateDirectory(temp);
                }
                var path = Path.Combine(temp, new Guid() + ".jpg");
                img.Save(path);
                Search.VIR obj = new Search.VIR();
                var b = new double[] { 0, 0, img.Height, img.Width };
                var res = obj.QueryImage(path, new MWNumericArray(b), dict_words, dict, inv_file,
                     if_weight, if_norm, if_norm, 0, files, _nTop);

                output = new string[res.Dimensions[1]];
                for (var i = 0; i < output.Length; ++i)
                {
                    output[i] = Path.Combine(@"\oxford\images", res[i + 1].ToString());
                }
                System.IO.File.Delete(path);
                //var fileName = fileContent.FileName;
            }
            return Json(output);
        }
    }
}