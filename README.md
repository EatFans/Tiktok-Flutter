<p align="center">
    <img src="doc/title.png" alt="title"/>
</p>

<hr />

## 使用Flutter开发一个抖音app

- 此项目，90%还原抖音app，所有UI设计按照抖音来实现，但是不同的是部分图标素材
- 项目中使用的数据部分为本地数据，数据来源于抖音，所有的视频非恶意盗取，仅供学习，无商业
- 项目中用到video_player、preload_page_view等插件依赖，很大部分Flutter widget
- 会持续开发完善


> APP使用到的视频全部来自本地assets资源，视频资源来源于抖音网页版中公开的视频，
> 非恶意盗用，视频资源只用于学习，无任何恶意，无任何商业行为。

<hr />

## 项目介绍

### 依赖

```yaml
dependencies:
  flutter:
    sdk: flutter
  # 图标
  cupertino_icons: ^1.0.8
  # 视频播放依赖
  video_player: ^2.10.0
  # 预加载页面滚动
  preload_page_view: ^0.2.0
```

这里使用到video_player来进行多媒体的播放，这个插件依赖会使用到原生的部分，如果iOS运行时候出现问题，需要下载配置 `CocoPods`，
然后在项目根目录`cd ios`进入ios目录，然后`pod install`安装，如果出现问题，请清除项目缓存，重新install，或者直接删除平台工程，
重新创建平台工程文件，然后重新进入ios目录，通过`pod install`进行install，CocoPods配置与安装请自行查询。如果还是出现问题，
请使用XCode打开ios工程，手动配置一下，请自行查询。

这里不使用flutter中的PageView，PageView滑动效果在这里并不好，这里就选用了preload_page_view插件，使用方法与PageView类似。

### 本地资源

本app使用的数据，全部来源于本地，不调用任何API接口，数据来源于本地，不从网络中获取，资源目录为`assets`
```yaml
flutter:

  assets:
    - assets/video/
    - assets/image/
```

## 效果预览
