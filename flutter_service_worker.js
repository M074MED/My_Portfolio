'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "76f08d47ff9f5715220992f993002504",
"assets/FontManifest.json": "a78f950d25c1e29b92a4a309465e60cd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "e37727819ae886b96dd8ff9a89e3f779",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "f9e67278086a4962bab5b5958c7f25a0",
"assets/packages/flutter_feather_icons/fonts/feather.ttf": "40469726c5ed792185741388e68dd9e8",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/images/Mohammed_Mamdouh.jpg": "5925e31a42e77f178031991c67c789cf",
"assets/assets/images/circle.png": "d2ca333f46f45f61d92fdc9d1993fae5",
"assets/assets/images/down-arrow.png": "4393cd5feeb20fb468c7eb223d1bbd06",
"assets/assets/images/skills1.png": "deb5646d77ef8e601e96576a3c548103",
"assets/assets/images/down-arrow-2.png": "de203dedb01f2871b4ebbec490c20a6c",
"assets/assets/images/Mohammed_Mamdouh_background_removed.png": "9c8ac228f18c6afdcf3dbdd3d7813c61",
"assets/assets/images/up-arrow.png": "d0c6457f5704962b99f0e6aa3e9b18e7",
"assets/assets/images/skills2.png": "7cb4a536aa03009e2bd37728b39797da",
"assets/assets/images/ios-down-arrow.png": "fa4679d2972f1d11355142a60ed34ede",
"assets/assets/images/skills.png": "f8c0570590d1d2968df0e0b5c83d3460",
"assets/assets/images/certificates/claude_code_in_action_cert.jpg": "dc4e20683707127d55b2892646839cdf",
"assets/assets/images/certificates/bsd_cs_ai_cert.jpg": "f7906f3320c07d88f29a42c4710d2423",
"assets/assets/images/certificates/web_dev_2_cert.png": "69a15272dde673023e9b8dea5303621a",
"assets/assets/images/certificates/fundamentals_of_predictive_project_management_cert.png": "2e626c62dfa60049104baa02f2253265",
"assets/assets/images/certificates/ai_fluency_framework_and_foundations_cert.jpg": "2ea83ba172e8247d59781ba6e468c046",
"assets/assets/images/certificates/fundamentals_of_agile_project_management_cert.png": "cb446c4c4f1203827ba78b7e7281bb3d",
"assets/assets/images/certificates/mobile_dev_2023_cert.jpg": "986786bad0633a146ca0ed1dc08e4c6c",
"assets/assets/images/certificates/mobile_dev_2024_cert.jpg": "1b2a8b34089d223a9efdae2600f0dc03",
"assets/assets/images/certificates/banque_misr_training_program_cert.png": "b0f95be11bcdaa5fe0ef0fc73726c02d",
"assets/assets/images/certificates/web_dev_1_cert.png": "e34962dfd35420b0e9660f4049e623aa",
"assets/assets/images/certificates/graduation_project_competition_cert.jpg": "976bded64c5002df2dca5e4a08e7db73",
"assets/assets/images/certificates/mobile_dev_2025_cert.jpeg": "b27074f9c6bf4c052e5a6e547b96b7c0",
"assets/assets/images/certificates/claude_101_cert.jpg": "d5c1bcaf5a43c16904a9a143d3ac2599",
"assets/assets/images/app_store.png": "a5b4d5bc4c7011d513e25fc1a01c9c44",
"assets/assets/images/google_play.png": "66c2a8d67e56b0aa0c779068dfad9f81",
"assets/assets/images/projects/mulham/16.png": "761007011674efe7f3ad763c438beb62",
"assets/assets/images/projects/mulham/4.png": "96762af35b49830be5bcc9de1ece92dc",
"assets/assets/images/projects/mulham/thumbnail.png": "10067d02328fe93e4c3c980287f8ce3b",
"assets/assets/images/projects/mulham/10.png": "febac1ffd86d84d7ab796db8703f2152",
"assets/assets/images/projects/mulham/11.png": "831f672eaa34c8ac5ed5fbe55c35cbe9",
"assets/assets/images/projects/mulham/14.png": "ada944a0658e93b056fe92d054b2dff2",
"assets/assets/images/projects/mulham/2.png": "12e608380e61cbf20e8fed20de062350",
"assets/assets/images/projects/mulham/1.png": "6aec1e1c51cd8eda7c6e5d3f30d54a4f",
"assets/assets/images/projects/mulham/7.png": "91ed69160c2535e0279fe5958b6080dc",
"assets/assets/images/projects/mulham/8.png": "86a10e0fa6114813a334843ac5b42bfc",
"assets/assets/images/projects/mulham/5.png": "f2a5ee18cd1b6f1f1d3671a48495a5e5",
"assets/assets/images/projects/mulham/3.png": "4fe8bd176a32a618333c45347ac75147",
"assets/assets/images/projects/mulham/9.png": "235f29ac2cdc94395c6689975729618e",
"assets/assets/images/projects/mulham/12.png": "21a8fb8fd64a8b6505abefef07a28956",
"assets/assets/images/projects/mulham/13.png": "a6a5d4c4f507877b9f1c8f68887b8c4b",
"assets/assets/images/projects/mulham/6.png": "3967d8e54915f9c2055e3364304d5094",
"assets/assets/images/projects/mulham/0.png": "5ce47e49155944b64007f4592e2f3884",
"assets/assets/images/projects/mulham/15.png": "078124777f6068e7e697ecab6844cc1f",
"assets/assets/images/projects/lms/thumbnail.png": "c483d2ad091325f2ed649cf686be6000",
"assets/assets/images/projects/lms/2.png": "db8e859896dc85e0c0be504a2190e862",
"assets/assets/images/projects/lms/1.png": "fe880b8bd91b7d83e3067886429a0f4e",
"assets/assets/images/projects/lms/0.png": "eb22d90d9222f3e2d2fd5c7417f24d4c",
"assets/assets/images/projects/trex/4.png": "071c7325a347d4c388ea33a5ba2c04d1",
"assets/assets/images/projects/trex/thumbnail.png": "253e766c232858c0617b6ad3ec6a037b",
"assets/assets/images/projects/trex/2.png": "4df44ef990bbbf553b82d8364d073c63",
"assets/assets/images/projects/trex/1.png": "7fa5ade56c9615c8e0b9112d0c055c11",
"assets/assets/images/projects/trex/5.png": "7a9631674a05f4bb3e658fb231432a46",
"assets/assets/images/projects/trex/3.png": "6de943718377dfa2f0c6e5ccbdffe382",
"assets/assets/images/projects/trex/6.png": "4c83befcf1c7e7aaba2662c56f1ef574",
"assets/assets/images/projects/trex/0.png": "48e5ebd91dcf19a540e3415502df983f",
"assets/assets/images/projects/webshop/4.png": "ea1c9cdc2b75dd25eeaebfe5ff3c5b43",
"assets/assets/images/projects/webshop/thumbnail.png": "0004ee0cadc9ab203eb3d2b87bc304cb",
"assets/assets/images/projects/webshop/2.png": "c98389cf99a16b93ea6ff97f42f71a97",
"assets/assets/images/projects/webshop/1.png": "d42e69ddcabd9863195d329e3ec2d86b",
"assets/assets/images/projects/webshop/5.png": "3d2856ac76f67a1a13c998e9aea3135e",
"assets/assets/images/projects/webshop/3.png": "976ff9fc8c3993fb012999a6034617d3",
"assets/assets/images/projects/webshop/6.png": "eae598050c6d899a4b2c7ee9d7c9c475",
"assets/assets/images/projects/webshop/0.png": "fa93ee366d113fd81fbbf7fe9892ec2d",
"assets/assets/images/projects/messageme/thumbnail.png": "7b324eef96266fd4dbf651761382bf92",
"assets/assets/images/projects/messageme/2.png": "683b2363d41a84299a74d70512a9819b",
"assets/assets/images/projects/messageme/1.png": "ba7af2a28193aceb7a67ca72992b6e42",
"assets/assets/images/projects/messageme/0.png": "b6e3b01710825d0dddfc825924cce552",
"assets/assets/images/projects/attendfy_pro/4.png": "d96c81effd18f7b47e84dfe96921db5a",
"assets/assets/images/projects/attendfy_pro/thumbnail.png": "857b2b053141f3b90c67c1bf072564e9",
"assets/assets/images/projects/attendfy_pro/2.png": "8df844f48df18e153fe155063a6891d1",
"assets/assets/images/projects/attendfy_pro/1.png": "4b57471b0fb7f11d68e00a9fc4491d4f",
"assets/assets/images/projects/attendfy_pro/5.png": "673b4d112a2eeeaabd54c3b23d7f49de",
"assets/assets/images/projects/attendfy_pro/3.png": "236f22686ca41eccfeaa88c9c0ca00b2",
"assets/assets/images/projects/attendfy_pro/6.png": "416a921ec08bc4f1d5f450a72215279c",
"assets/assets/images/projects/attendfy_pro/0.png": "256963f9a17c96739f6991a3458635ab",
"assets/assets/images/projects/spacescape/4.png": "b19ec3ccef1b86ce8bc49154ef6ae9b1",
"assets/assets/images/projects/spacescape/thumbnail.png": "3d2948b8a88d15dc6bf096998054ee98",
"assets/assets/images/projects/spacescape/2.png": "b3f5ff52279b7894314e2f5def0b1218",
"assets/assets/images/projects/spacescape/1.mp4": "77fdd0bb0c58d0412a446527a70e92c8",
"assets/assets/images/projects/spacescape/5.png": "029c6a01e8d033aaa2bd86f95d63bfad",
"assets/assets/images/projects/spacescape/3.png": "ac21dde70e7a46afa1cc925b6ed522fb",
"assets/assets/images/projects/spacescape/6.png": "b50e2bb6baaef9be8248b9ccaa69f9a8",
"assets/assets/images/projects/spacescape/0.png": "0791b0bf8811160754905ac682f4877f",
"assets/assets/images/projects/metatris/4.png": "ff26623809f2e36ccbecdc99c59f7163",
"assets/assets/images/projects/metatris/thumbnail.png": "dde43da101045db2e69cf832311c3bfb",
"assets/assets/images/projects/metatris/2.png": "c6d3b6ddc8e378546b400b42ac029364",
"assets/assets/images/projects/metatris/1.png": "0e7c0346b27cb6f4a60885a179333f4f",
"assets/assets/images/projects/metatris/5.png": "b784ebb7c6af33e5f9572860db1170ab",
"assets/assets/images/projects/metatris/3.png": "7c5ccbbcd6941dd75652d2dc623d2f54",
"assets/assets/images/projects/metatris/6.png": "a5db841f522425195e0c0b424347191b",
"assets/assets/images/projects/metatris/0.png": "18253ab89f240d09f20b4c64194151a7",
"assets/assets/images/projects/job_board/4.png": "7b8f66a575cd70d250383f9bcd4d71eb",
"assets/assets/images/projects/job_board/thumbnail.png": "8ac72c8470e1248bc2662ef0a7a9ea62",
"assets/assets/images/projects/job_board/2.png": "13670c313ebf36d72c094a094cc7c9b2",
"assets/assets/images/projects/job_board/1.png": "4fef12abf69687288ecc15857293cf9e",
"assets/assets/images/projects/job_board/5.png": "0b81b46cd49eb244a618e8ea54272f52",
"assets/assets/images/projects/job_board/3.png": "992bee20c6aa0ef52788f2a332ef9c6e",
"assets/assets/images/projects/job_board/6.png": "b1b38be0757a46150a29370a5e48b9c4",
"assets/assets/images/projects/job_board/0.png": "8b79ad8437f843006a330616d7af1b7f",
"assets/assets/images/projects/m074med_v1/thumbnail.png": "358dca4a4371ae663dc6ce408e9aa6eb",
"assets/assets/images/projects/m074med_v1/1.png": "2b3b2f0332e27eba20d9631105ef6116",
"assets/assets/images/projects/m074med_v1/0.png": "fcd398333b959afc3d389423630f0570",
"assets/assets/images/projects/space_fortress/thumbnail.png": "523834c87b6613afaf0090729da17022",
"assets/assets/images/projects/space_fortress/2.png": "fa93f696ecc7dc0e53407eb6150906b0",
"assets/assets/images/projects/space_fortress/1.png": "acce2e3fedfa208824648e0b873771fc",
"assets/assets/images/projects/space_fortress/0.png": "64dda31cbaba469bdcac796fa7ceafdf",
"assets/assets/images/projects/gamechanger/4.png": "279c0d41687302ba94c89b9f771c018e",
"assets/assets/images/projects/gamechanger/thumbnail.png": "af79a598779d8ea9e99dc4215603965d",
"assets/assets/images/projects/gamechanger/2.png": "656fab0a29e946263af79fedd408b2a0",
"assets/assets/images/projects/gamechanger/1.png": "5ec2c5f2b1bb7cd08a6048fdb10c9dfc",
"assets/assets/images/projects/gamechanger/5.png": "18253ab89f240d09f20b4c64194151a7",
"assets/assets/images/projects/gamechanger/3.png": "bc0c681d29c33e8ff59f650161d72a1f",
"assets/assets/images/projects/gamechanger/6.png": "64dda31cbaba469bdcac796fa7ceafdf",
"assets/assets/images/projects/gamechanger/0.png": "5e8369d15cee2e2bd6d13aeb0eeade43",
"assets/assets/images/projects/fait/4.png": "788cff21feddb624ef232857e4a55a55",
"assets/assets/images/projects/fait/thumbnail.png": "2a95ae866f5f141d429f2edb3863c66c",
"assets/assets/images/projects/fait/10.png": "74de3cc32222bd111fcf3fd778121e60",
"assets/assets/images/projects/fait/11.png": "f4f7b61f9c5e12d28b88f504eab84025",
"assets/assets/images/projects/fait/2.png": "14ca775780a074a410d47ec09701ad0e",
"assets/assets/images/projects/fait/1.png": "974914906854312082f246895ad25943",
"assets/assets/images/projects/fait/7.png": "2ccb8a59b7938593970276338932f6c3",
"assets/assets/images/projects/fait/8.png": "92e39f88ffa5fa31dafb0bf4cf0c87ce",
"assets/assets/images/projects/fait/5.png": "cbdb316add6d7131a297a9e614d72b3e",
"assets/assets/images/projects/fait/3.png": "4881995a5da22298a893be6f4a612e7c",
"assets/assets/images/projects/fait/9.png": "745751787afe2bdecd013dd7e9cb2202",
"assets/assets/images/projects/fait/6.png": "1ab217dec7757ff6b06ea5881985f57a",
"assets/assets/images/projects/fait/0.png": "b65c67f4904f3755fdb327605cc8bba1",
"assets/assets/images/works.png": "5c6f8eb3a22f703781aad6c2528cf0cd",
"assets/assets/images/right-arrow.png": "62a7bab73a0fe40acd3f4555adfcab91",
"assets/assets/fonts/visuelt/VisueltPro-Regular.ttf": "0f8cd2494eb8c5e3a33352b2dd38fd61",
"assets/assets/fonts/visuelt/VisueltPro-Black.ttf": "691b6f9aa3ee625e3cd8da2f8849a126",
"assets/assets/fonts/visuelt/VisueltPro-Medium.ttf": "cf4dbc20776a2b309fe30a9bbfe7de0a",
"assets/assets/fonts/visuelt/VisueltPro-Light.ttf": "2a1df2ff00c2611bf1b7fdeeaeebfa59",
"assets/assets/fonts/visuelt/VisueltPro-Thin.ttf": "82d7b5b67c24f00acb08f2dccf1fd03b",
"assets/assets/fonts/visuelt/VisueltPro-Bold.ttf": "18acd33c965a455418d4204f0f334ea8",
"assets/assets/fonts/visuelt/VisueltPro-ExtraLight.ttf": "90bfa0766e43260710e3c6ac0f78c9e9",
"assets/AssetManifest.bin.json": "6d257f2c72bac9475a2dd396b5940b02",
"assets/fonts/MaterialIcons-Regular.otf": "cf1c98545088d247523d8692a5d9a6b9",
"assets/dotenv": "f19b0d143c437cabb012fc082ce01e74",
"assets/AssetManifest.bin": "f1922f2399abec1f7fa182f78e8a0efb",
"assets/NOTICES": "4497f31cb80f8f57c9c8de8bc2d61311",
"assets/AssetManifest.json": "60b022a7cc8ace7088ffd18edf32bf19",
"icons/logo-m074med-1.png": "c9c1749b275f61ebc563d6596ccf2569",
"icons/logo-m074med-2.png": "22d3ed71ce109da6c44584f131efe31e",
"flutter_bootstrap.js": "679268d33e3eac1ff038135e320f55d3",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"index.html": "6593ffea2ed05654f3a7bb2797cd5399",
"/": "6593ffea2ed05654f3a7bb2797cd5399",
"main.dart.js": "2aa7e97f43cbc40a9e8d4d17c0dc18c8",
"manifest.json": "b4d3094c0d738379937e68909ff270c6",
"version.json": "335862087810feb915e524a14e436b62"};
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
