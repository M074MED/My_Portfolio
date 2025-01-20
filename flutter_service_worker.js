'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/logo-m074med-1.png": "c9c1749b275f61ebc563d6596ccf2569",
"icons/logo-m074med-2.png": "22d3ed71ce109da6c44584f131efe31e",
"assets/assets/images/up-arrow.png": "d0c6457f5704962b99f0e6aa3e9b18e7",
"assets/assets/images/down-arrow-2.png": "de203dedb01f2871b4ebbec490c20a6c",
"assets/assets/images/google_play.png": "66c2a8d67e56b0aa0c779068dfad9f81",
"assets/assets/images/skills1.png": "deb5646d77ef8e601e96576a3c548103",
"assets/assets/images/works.png": "5c6f8eb3a22f703781aad6c2528cf0cd",
"assets/assets/images/Mohammed_Mamdouh.jpg": "5925e31a42e77f178031991c67c789cf",
"assets/assets/images/projects/fait/8.png": "a2aab5bdb92ec1dd18462f89c3ed1d9b",
"assets/assets/images/projects/fait/11.png": "7ab62bba9cf6f11a11fbc7ffc5a93524",
"assets/assets/images/projects/fait/2.png": "3ef5792590e22918caa328fc255d0460",
"assets/assets/images/projects/fait/0.png": "f1cef6f6eadca9dcfe6800c01088c2e0",
"assets/assets/images/projects/fait/10.png": "9eda59597553e0a21b764c3319d811cb",
"assets/assets/images/projects/fait/3.png": "6cc34772ab9c6bc88052b34022905ce4",
"assets/assets/images/projects/fait/1.png": "8b8af8a6296e0087b3aedfec71bc1bd3",
"assets/assets/images/projects/fait/thumbnail.png": "2a95ae866f5f141d429f2edb3863c66c",
"assets/assets/images/projects/fait/9.png": "b6a089feaa9e0c1f92fe7009e7e8b254",
"assets/assets/images/projects/fait/5.png": "75bdbdfc6036f32a6b751bb93f2d14c1",
"assets/assets/images/projects/fait/6.png": "8099943df67ad32e26f01409c60f5ba3",
"assets/assets/images/projects/fait/7.png": "97485f935b197f50a9e08671e5f6fa0a",
"assets/assets/images/projects/fait/4.png": "d40276cc566f4ef9bddf035a24a25a6c",
"assets/assets/images/projects/mulham/12.png": "f8ef66b3be47eb2aa1b9f25e5b194280",
"assets/assets/images/projects/mulham/8.png": "8ce4c7d39a6ae76760dbc8ab6e71f647",
"assets/assets/images/projects/mulham/11.png": "cc1125f08b28ee1f4bbb70dd60f0a178",
"assets/assets/images/projects/mulham/2.png": "77c351aaa25484be20fc566732d1512d",
"assets/assets/images/projects/mulham/0.png": "a6faf98bbb9212c46cff70baa22e39ec",
"assets/assets/images/projects/mulham/10.png": "cfa37051ecc4fe72aaba4c2419eb04fc",
"assets/assets/images/projects/mulham/3.png": "26df80c3273225a7d95c8ab9e7328061",
"assets/assets/images/projects/mulham/1.png": "1f0bb02a51047ad5ebc1fadf682a9426",
"assets/assets/images/projects/mulham/16.png": "7de08a05e61493ef450881efee5374eb",
"assets/assets/images/projects/mulham/14.png": "ac19c1856cadea1511d0acaa24493c12",
"assets/assets/images/projects/mulham/15.png": "f836dfe73b0911259cf4972687c45ad1",
"assets/assets/images/projects/mulham/thumbnail.png": "10067d02328fe93e4c3c980287f8ce3b",
"assets/assets/images/projects/mulham/9.png": "34c708411aa9ff6b63937a565825eb28",
"assets/assets/images/projects/mulham/5.png": "2d51038f7b368e8e67fd937ff9d75585",
"assets/assets/images/projects/mulham/6.png": "4f9eeff4355b43f7cb9642ab6e803b46",
"assets/assets/images/projects/mulham/7.png": "4e1b6c27317f98ea3e3e606391582417",
"assets/assets/images/projects/mulham/13.png": "e3bfb083147bd068596cdd1a54377172",
"assets/assets/images/projects/mulham/4.png": "27102f5bedd1d252aea5cc2ccda0e915",
"assets/assets/images/projects/attendfy_pro/2.png": "15afeba33a6323bc44c9224739f31450",
"assets/assets/images/projects/attendfy_pro/0.png": "7be6477de27a38d3533c429923118f79",
"assets/assets/images/projects/attendfy_pro/3.png": "ca7d20fce3f3773bf940548f89ae7787",
"assets/assets/images/projects/attendfy_pro/1.png": "9116237b905b0e17b39758718172b33a",
"assets/assets/images/projects/attendfy_pro/thumbnail.png": "857b2b053141f3b90c67c1bf072564e9",
"assets/assets/images/projects/attendfy_pro/5.png": "21fe648f7b3c5b42fa65fbfbf6c53202",
"assets/assets/images/projects/attendfy_pro/6.png": "7453fe8770a1936974a2c0cf85d23bdd",
"assets/assets/images/projects/attendfy_pro/4.png": "d4ce1725ce1ea2cea08f0982bd08b0d8",
"assets/assets/images/projects/lms/2.png": "db8e859896dc85e0c0be504a2190e862",
"assets/assets/images/projects/lms/0.png": "40707c83ef9b6a78b34a9a72edc265a3",
"assets/assets/images/projects/lms/1.png": "fe880b8bd91b7d83e3067886429a0f4e",
"assets/assets/images/projects/lms/thumbnail.png": "c483d2ad091325f2ed649cf686be6000",
"assets/assets/images/projects/space_fortress/2.png": "ef194a9361a78995b0efdb0c792abb51",
"assets/assets/images/projects/space_fortress/0.png": "c7e52ac4e123eb6a1354a461e5bc781c",
"assets/assets/images/projects/space_fortress/1.png": "94882112478352ca60a50e58b8bddc90",
"assets/assets/images/projects/space_fortress/thumbnail.png": "523834c87b6613afaf0090729da17022",
"assets/assets/images/projects/metatris/2.png": "cec4909b9083fd6704316ce716ea15fa",
"assets/assets/images/projects/metatris/0.png": "1b43cc75978717c37223fc9c0e3e459f",
"assets/assets/images/projects/metatris/3.png": "8e81ae1bf0fc54625fd2d2234d8b9cef",
"assets/assets/images/projects/metatris/1.png": "b7c381ffb80f6941ef5d6ab54e40aff3",
"assets/assets/images/projects/metatris/thumbnail.png": "dde43da101045db2e69cf832311c3bfb",
"assets/assets/images/projects/metatris/5.png": "0f1be59353f0f5d6059d037b4f2aefca",
"assets/assets/images/projects/metatris/6.png": "1ff77a76bbe28e9efab993bd333b6956",
"assets/assets/images/projects/metatris/4.png": "00c2a295a376a9f211200fc5711b03c6",
"assets/assets/images/projects/gamechanger/2.png": "25438a274e0036a29cf8b6ba41f5b1c6",
"assets/assets/images/projects/gamechanger/0.png": "fb3b6bb4bfa9e6a17914f716652b05de",
"assets/assets/images/projects/gamechanger/3.png": "5829edd876d8d2b2574df3f9bfb443fb",
"assets/assets/images/projects/gamechanger/1.png": "fe3be1cedcc06289a705d9200333319a",
"assets/assets/images/projects/gamechanger/thumbnail.png": "af79a598779d8ea9e99dc4215603965d",
"assets/assets/images/projects/gamechanger/5.png": "1b43cc75978717c37223fc9c0e3e459f",
"assets/assets/images/projects/gamechanger/6.png": "c7e52ac4e123eb6a1354a461e5bc781c",
"assets/assets/images/projects/gamechanger/4.png": "5f48dde4d5dc8850b04ba69e73c39453",
"assets/assets/images/projects/spacescape/1.mp4": "77fdd0bb0c58d0412a446527a70e92c8",
"assets/assets/images/projects/spacescape/2.png": "0396558b29870dfd1c39416be803e47d",
"assets/assets/images/projects/spacescape/0.png": "85c7200d02cf6198c0dfb53fde1ee618",
"assets/assets/images/projects/spacescape/3.png": "c8b52744aedae58543410307c4c89f8d",
"assets/assets/images/projects/spacescape/thumbnail.png": "3d2948b8a88d15dc6bf096998054ee98",
"assets/assets/images/projects/spacescape/5.png": "ebd2f94b53694882bc30e2b92c90a8d9",
"assets/assets/images/projects/spacescape/6.png": "360e54de25f4157631f8b1e4bfffea3a",
"assets/assets/images/projects/spacescape/4.png": "94f604bb340d9e090847f35a102b925b",
"assets/assets/images/projects/m074med_v1/0.png": "61aab77a90b24ecc9493645f6a1790b1",
"assets/assets/images/projects/m074med_v1/1.png": "e504bdb39d9e15d17ed9568e04642430",
"assets/assets/images/projects/m074med_v1/thumbnail.png": "358dca4a4371ae663dc6ce408e9aa6eb",
"assets/assets/images/projects/webshop/2.png": "47fb86c5bef398bff2d9ad51365361b8",
"assets/assets/images/projects/webshop/0.png": "a81d71699306d31cc62448f8b78d9a86",
"assets/assets/images/projects/webshop/3.png": "2742b47a0b02a3a09d1d5e78eee0f862",
"assets/assets/images/projects/webshop/1.png": "d5d1f43b7c22b93294ed79e7badf3230",
"assets/assets/images/projects/webshop/thumbnail.png": "0004ee0cadc9ab203eb3d2b87bc304cb",
"assets/assets/images/projects/webshop/5.png": "b34401ae1c2b424fdb5304dd6b9fc5ef",
"assets/assets/images/projects/webshop/6.png": "ab38d420635078dbcf468a29d920b420",
"assets/assets/images/projects/webshop/4.png": "69f2666fa7f45214f3c213c4f3f07d97",
"assets/assets/images/projects/job_board/2.png": "3fa6f800535036cd7dd24d0ff5ea1c37",
"assets/assets/images/projects/job_board/0.png": "8b79ad8437f843006a330616d7af1b7f",
"assets/assets/images/projects/job_board/3.png": "b08f2a30d1b2815d64f977b6d48be28e",
"assets/assets/images/projects/job_board/1.png": "1680e5c8e452a0223b31daaa70ecadd9",
"assets/assets/images/projects/job_board/thumbnail.png": "8ac72c8470e1248bc2662ef0a7a9ea62",
"assets/assets/images/projects/job_board/5.png": "b7acfdacda6ddd43030e90bd7584b008",
"assets/assets/images/projects/job_board/6.png": "b1b38be0757a46150a29370a5e48b9c4",
"assets/assets/images/projects/job_board/4.png": "6e0cafecf84ee8665283ea6be1e1bb17",
"assets/assets/images/projects/messageme/2.png": "18578e0f0170c81c13abf23c6c8c5d45",
"assets/assets/images/projects/messageme/0.png": "830fcbb71ac40fb8ab16eb308f93cac5",
"assets/assets/images/projects/messageme/1.png": "0a9a2c19318f81a35c45d0f0e740cb25",
"assets/assets/images/projects/messageme/thumbnail.png": "7b324eef96266fd4dbf651761382bf92",
"assets/assets/images/down-arrow.png": "4393cd5feeb20fb468c7eb223d1bbd06",
"assets/assets/images/skills2.png": "7cb4a536aa03009e2bd37728b39797da",
"assets/assets/images/certificates/mobile_dev_2024_cert.jpg": "1b2a8b34089d223a9efdae2600f0dc03",
"assets/assets/images/certificates/banque_misr_training_program_cert.png": "b0f95be11bcdaa5fe0ef0fc73726c02d",
"assets/assets/images/certificates/web_dev_2_cert.png": "69a15272dde673023e9b8dea5303621a",
"assets/assets/images/certificates/bsd_cs_ai_cert.jpg": "f7906f3320c07d88f29a42c4710d2423",
"assets/assets/images/certificates/graduation_project_competition_cert.jpg": "976bded64c5002df2dca5e4a08e7db73",
"assets/assets/images/certificates/fundamentals_of_predictive_project_management_cert.png": "2e626c62dfa60049104baa02f2253265",
"assets/assets/images/certificates/web_dev_1_cert.png": "e34962dfd35420b0e9660f4049e623aa",
"assets/assets/images/certificates/mobile_dev_2023_cert.jpg": "986786bad0633a146ca0ed1dc08e4c6c",
"assets/assets/images/certificates/fundamentals_of_agile_project_management_cert.png": "cb446c4c4f1203827ba78b7e7281bb3d",
"assets/assets/images/app_store.png": "a5b4d5bc4c7011d513e25fc1a01c9c44",
"assets/assets/images/right-arrow.png": "62a7bab73a0fe40acd3f4555adfcab91",
"assets/assets/images/skills.png": "f8c0570590d1d2968df0e0b5c83d3460",
"assets/assets/images/ios-down-arrow.png": "fa4679d2972f1d11355142a60ed34ede",
"assets/assets/images/Mohammed_Mamdouh_background_removed.png": "fdf28429404ec2345f3cb6af3a854775",
"assets/assets/images/circle.png": "d2ca333f46f45f61d92fdc9d1993fae5",
"assets/assets/fonts/visuelt/VisueltPro-Regular.ttf": "0f8cd2494eb8c5e3a33352b2dd38fd61",
"assets/assets/fonts/visuelt/VisueltPro-Thin.ttf": "82d7b5b67c24f00acb08f2dccf1fd03b",
"assets/assets/fonts/visuelt/VisueltPro-ExtraLight.ttf": "90bfa0766e43260710e3c6ac0f78c9e9",
"assets/assets/fonts/visuelt/VisueltPro-Bold.ttf": "18acd33c965a455418d4204f0f334ea8",
"assets/assets/fonts/visuelt/VisueltPro-Black.ttf": "691b6f9aa3ee625e3cd8da2f8849a126",
"assets/assets/fonts/visuelt/VisueltPro-Light.ttf": "2a1df2ff00c2611bf1b7fdeeaeebfa59",
"assets/assets/fonts/visuelt/VisueltPro-Medium.ttf": "cf4dbc20776a2b309fe30a9bbfe7de0a",
"assets/AssetManifest.bin": "b138f7e35d4b614f7845c5d35ddca8cb",
"assets/NOTICES": "39724ca6ebb250fc3f8485fc4b46f3b3",
"assets/AssetManifest.json": "a44655b4b999c72047bd177dd6e47e0c",
"assets/fonts/MaterialIcons-Regular.otf": "754a40368feffa4c3d27d7b3b5cf46d9",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_feather_icons/fonts/feather.ttf": "40469726c5ed792185741388e68dd9e8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "f9e67278086a4962bab5b5958c7f25a0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4402a91ef3a24d3796ea7ea87c89dea1",
"assets/FontManifest.json": "a78f950d25c1e29b92a4a309465e60cd",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "386444b7ea8d6a9d8f3cd3cb5a4e02a0",
"assets/dotenv": "f19b0d143c437cabb012fc082ce01e74",
"version.json": "335862087810feb915e524a14e436b62",
"manifest.json": "b4d3094c0d738379937e68909ff270c6",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"index.html": "6593ffea2ed05654f3a7bb2797cd5399",
"/": "6593ffea2ed05654f3a7bb2797cd5399",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "e311edb6f0aae7f9ee91cb05aa03922e",
"main.dart.js": "da3039b7ac90009d02b1d2cae633bd70"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
