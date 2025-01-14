'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/logo-m074med-1.png": "c9c1749b275f61ebc563d6596ccf2569",
"icons/logo-m074med-2.png": "22d3ed71ce109da6c44584f131efe31e",
"assets/assets/images/up-arrow.png": "d0c6457f5704962b99f0e6aa3e9b18e7",
"assets/assets/images/down-arrow-2.png": "de203dedb01f2871b4ebbec490c20a6c",
"assets/assets/images/google_play.png": "7c42f3803d546db3d393106501dba541",
"assets/assets/images/skills1.png": "77752281625f377820cdc5de7e66512c",
"assets/assets/images/works.png": "5c6f8eb3a22f703781aad6c2528cf0cd",
"assets/assets/images/Mohammed_Mamdouh.jpg": "1778ad6d8ebcbef87d0a30e280a20735",
"assets/assets/images/projects/fait/8.png": "cd3a457aa4831a2e12c36c566bcad6a2",
"assets/assets/images/projects/fait/11.png": "4145d0656069b2600893e473c6b73905",
"assets/assets/images/projects/fait/2.png": "4ac7484e705bf6acd1bfead8b8b80ded",
"assets/assets/images/projects/fait/0.png": "d8b03aabef26974c6cc4dfafa34aa552",
"assets/assets/images/projects/fait/10.png": "541992985571b8f993663f830ba07119",
"assets/assets/images/projects/fait/3.png": "cf6e782f184da84ced6e4ea804d4cca1",
"assets/assets/images/projects/fait/1.png": "8860e883f97b43c701d08061af915f75",
"assets/assets/images/projects/fait/9.png": "cd9f43b71964a73e7c31f7d6c663a007",
"assets/assets/images/projects/fait/5.png": "2105c76236e45692bfffa1f090500098",
"assets/assets/images/projects/fait/6.png": "3f6bd497448e845ca03c322dfa4936e2",
"assets/assets/images/projects/fait/7.png": "12ce1b804d1541dcee20838c94ee6724",
"assets/assets/images/projects/fait/4.png": "5a3ed932aa270a45fb98f118d5edb6af",
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
"assets/assets/images/projects/mulham/9.png": "34c708411aa9ff6b63937a565825eb28",
"assets/assets/images/projects/mulham/5.png": "2d51038f7b368e8e67fd937ff9d75585",
"assets/assets/images/projects/mulham/6.png": "4f9eeff4355b43f7cb9642ab6e803b46",
"assets/assets/images/projects/mulham/7.png": "4e1b6c27317f98ea3e3e606391582417",
"assets/assets/images/projects/mulham/13.png": "e3bfb083147bd068596cdd1a54377172",
"assets/assets/images/projects/mulham/4.png": "27102f5bedd1d252aea5cc2ccda0e915",
"assets/assets/images/projects/attendfy_pro/2.png": "58a593051dcf7b912ede9e36f8875dc9",
"assets/assets/images/projects/attendfy_pro/0.png": "24befe46c4956bdfc273ff2430dcefba",
"assets/assets/images/projects/attendfy_pro/3.png": "e1fa5d8b8be63d77ba1bda17ed768d71",
"assets/assets/images/projects/attendfy_pro/1.png": "6df2bf12225300c29c2bbe9f49a4ae3d",
"assets/assets/images/projects/attendfy_pro/5.png": "14c37b614c421174c81aa30ed5da28c0",
"assets/assets/images/projects/attendfy_pro/6.png": "30d5826b7e21044e4d9ed9a33af5337d",
"assets/assets/images/projects/attendfy_pro/4.png": "93f0a1770aea33d0bd08c4cd960b68a9",
"assets/assets/images/projects/lms/2.png": "db8e859896dc85e0c0be504a2190e862",
"assets/assets/images/projects/lms/0.png": "9ee1bc5dc7861a092d8c9605d2cf9f66",
"assets/assets/images/projects/lms/1.png": "fe880b8bd91b7d83e3067886429a0f4e",
"assets/assets/images/projects/space_fortress/2.png": "0893efe8e8cc681c166f1a267ebca52f",
"assets/assets/images/projects/space_fortress/0.png": "f5a860e67c2952a7705800f1098cc426",
"assets/assets/images/projects/space_fortress/1.png": "96d998012e8cb76cf243161f1344dccf",
"assets/assets/images/projects/metatris/2.png": "34edf287f87d13999c120fb3bc2a21e8",
"assets/assets/images/projects/metatris/0.png": "2dd6f90d683870047e96764c0f30d29a",
"assets/assets/images/projects/metatris/3.png": "e23ab3ca825efaaed52c7872d061bb00",
"assets/assets/images/projects/metatris/1.png": "6e48c69a51f9fd442dcf9d623e493bb6",
"assets/assets/images/projects/metatris/5.png": "0217c5f7ba0d31b0f09bc837e30cd180",
"assets/assets/images/projects/metatris/6.png": "471a6a292a3ba751353a671e7600807c",
"assets/assets/images/projects/metatris/4.png": "e83ab3d7c43f1ce4a13ab30c1d80fd40",
"assets/assets/images/projects/gamechanger/2.png": "eeb87da79056b4c5c2e6f19dbac6a1bb",
"assets/assets/images/projects/gamechanger/0.png": "a0d1d063058c4bc94b44fd6655abac55",
"assets/assets/images/projects/gamechanger/3.png": "3a45b2c48937c21080f0ae0e285a232a",
"assets/assets/images/projects/gamechanger/1.png": "063098d171f661384e07c0bd2a00a4f9",
"assets/assets/images/projects/gamechanger/5.png": "2dd6f90d683870047e96764c0f30d29a",
"assets/assets/images/projects/gamechanger/6.png": "f5a860e67c2952a7705800f1098cc426",
"assets/assets/images/projects/gamechanger/4.png": "0f81ae6274d02af3233ae3e630c4c1b7",
"assets/assets/images/projects/spacescape/1.mp4": "77fdd0bb0c58d0412a446527a70e92c8",
"assets/assets/images/projects/spacescape/2.png": "f6a5a7b543a54f94a7f4eb1625176edd",
"assets/assets/images/projects/spacescape/0.png": "f857e652d4f2f59c025e854dcff610d1",
"assets/assets/images/projects/spacescape/3.png": "59acc403ac7d65f1ff7bdcec0c205500",
"assets/assets/images/projects/spacescape/5.png": "c425674965e9e46b5749809a97ca91a9",
"assets/assets/images/projects/spacescape/6.png": "1df88fea07ba0735502c74036de1c2d4",
"assets/assets/images/projects/spacescape/4.png": "5cd7ccb3bcb25c9f4da0d8119aa204dc",
"assets/assets/images/projects/m074med_v1/0.png": "61aab77a90b24ecc9493645f6a1790b1",
"assets/assets/images/projects/m074med_v1/1.png": "edd52f27c0c079f63e5968409f4091d8",
"assets/assets/images/projects/webshop/2.png": "74df0a0e4faa1ae9be61df357fba470e",
"assets/assets/images/projects/webshop/0.png": "a81d71699306d31cc62448f8b78d9a86",
"assets/assets/images/projects/webshop/3.png": "6e41f34e02b8d1efeb671e3409a997b6",
"assets/assets/images/projects/webshop/1.png": "778f073bd067e231277ddae81e09f4ef",
"assets/assets/images/projects/webshop/5.png": "0e6c823040034ee6ae1140dd9c2e3bf4",
"assets/assets/images/projects/webshop/6.png": "82724850f8448ee4c01909ed41ccbbfa",
"assets/assets/images/projects/webshop/4.png": "27444ea7ad7d9714678820d6221a3bb6",
"assets/assets/images/projects/job_board/2.png": "5d3db0d8e7484204a4576d9c232902ab",
"assets/assets/images/projects/job_board/0.png": "8b79ad8437f843006a330616d7af1b7f",
"assets/assets/images/projects/job_board/3.png": "6bda4d2864b045dfbf183842e0264d0e",
"assets/assets/images/projects/job_board/1.png": "1fad67aa13acc5e122f1a3a55de266ea",
"assets/assets/images/projects/job_board/5.png": "c1d8406f2a805901561de2a5d8c9e35f",
"assets/assets/images/projects/job_board/6.png": "b1b38be0757a46150a29370a5e48b9c4",
"assets/assets/images/projects/job_board/4.png": "d32156a477c4c20a0334ecc495d17b9d",
"assets/assets/images/projects/messageme/2.png": "b16eeaef7fb09157dcdd62c307702a40",
"assets/assets/images/projects/messageme/0.png": "f3e5dd2a88ee08d36902c53db07eac1f",
"assets/assets/images/projects/messageme/1.png": "1d5821378b21079c2870af1ea8dcf410",
"assets/assets/images/down-arrow.png": "4393cd5feeb20fb468c7eb223d1bbd06",
"assets/assets/images/skills2.png": "5849f99db0aaf1026199cd184087deae",
"assets/assets/images/certificates/mobile_dev_2024_cert.jpg": "a3ec7a1a5256ce4bb1456fbdd7f7e097",
"assets/assets/images/certificates/banque_misr_training_program_cert.png": "f1aa079837f772b0c60ded3b47696fd3",
"assets/assets/images/certificates/web_dev_2_cert.png": "cdd37c95941b5086105350d0598ff4a5",
"assets/assets/images/certificates/bsd_cs_ai_cert.jpg": "978a1b1caeb5d01eb5aaeb58b2707187",
"assets/assets/images/certificates/graduation_project_competition_cert.jpg": "44259ced1586970b2620342f955263e1",
"assets/assets/images/certificates/fundamentals_of_predictive_project_management_cert.png": "2e626c62dfa60049104baa02f2253265",
"assets/assets/images/certificates/web_dev_1_cert.png": "04f815c47af2429965548bc1d29f2a0b",
"assets/assets/images/certificates/mobile_dev_2023_cert.jpg": "8146e86e65c7ff09b67329257f1b10ec",
"assets/assets/images/certificates/fundamentals_of_agile_project_management_cert.png": "cb446c4c4f1203827ba78b7e7281bb3d",
"assets/assets/images/app_store.png": "e2b089e5b73fecebf9da4fc23663fe6c",
"assets/assets/images/right-arrow.png": "62a7bab73a0fe40acd3f4555adfcab91",
"assets/assets/images/skills.png": "2bd1870ebedbbd39a41827675a2846c3",
"assets/assets/images/ios-down-arrow.png": "fa4679d2972f1d11355142a60ed34ede",
"assets/assets/images/Mohammed_Mamdouh_background_removed.png": "1c87a5d5d48573352cbbb2ea5db0182f",
"assets/assets/images/circle.png": "663d5187ada8666bfa87120d1665605f",
"assets/assets/fonts/visuelt/VisueltPro-Regular.ttf": "0f8cd2494eb8c5e3a33352b2dd38fd61",
"assets/assets/fonts/visuelt/VisueltPro-Thin.ttf": "82d7b5b67c24f00acb08f2dccf1fd03b",
"assets/assets/fonts/visuelt/VisueltPro-ExtraLight.ttf": "90bfa0766e43260710e3c6ac0f78c9e9",
"assets/assets/fonts/visuelt/VisueltPro-Bold.ttf": "18acd33c965a455418d4204f0f334ea8",
"assets/assets/fonts/visuelt/VisueltPro-Black.ttf": "691b6f9aa3ee625e3cd8da2f8849a126",
"assets/assets/fonts/visuelt/VisueltPro-Light.ttf": "2a1df2ff00c2611bf1b7fdeeaeebfa59",
"assets/assets/fonts/visuelt/VisueltPro-Medium.ttf": "cf4dbc20776a2b309fe30a9bbfe7de0a",
"assets/AssetManifest.bin": "91d79ac8cd9951bf14f1d74ccb187c46",
"assets/NOTICES": "ce9ecaed62061a404ace27539bff70a5",
"assets/AssetManifest.json": "1c0a3730a23cb47e6393337a9bc50bf5",
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
"assets/AssetManifest.bin.json": "706c2c0d4310946534a707326e8d17df",
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
"index.html": "4d5ff1ec79eb1dcb4b2319c8573e95b7",
"/": "4d5ff1ec79eb1dcb4b2319c8573e95b7",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "42ad608463c9b5e1853c988a3c8120ff",
"main.dart.js": "89e5618fdf0f2fd4f130338b66125cad"};
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
