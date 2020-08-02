import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class AdMobService {
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>[
      "Peso",
      "saudavel",
      "imc",
      "IMC",
    ],
    childDirected: false,
    testDevices: <String>[],
  );
  BannerAd bannerAd;
  InterstitialAd interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        //print("BannerAd event is $event");
      },
    );
  }

  InterstitialAd createInterstitialAd(BuildContext context) {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        /*  if (event == MobileAdEvent.opened ||
              event == MobileAdEvent.failedToLoad)
            Navigator.pushNamed(context, "/opcoes"); */
      },
    );
  }

  void mostrarBanner() {
    bannerAd = createBannerAd()
      ..load()
      ..show();
  }

  void mostrarInterstitial(BuildContext context) {
    interstitialAd = createInterstitialAd(context)
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }
}
