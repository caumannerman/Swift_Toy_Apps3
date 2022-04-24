# Swift_Toy_Apps3
Swift와 OpenAPI를 사용한 간단한 프로젝트 7가지

# 1. 자산관리 App

# 2. AppStore 앱 

설명 영상: https://www.youtube.com/watch?v=WI2H7lAXY_g

UITabVarController 안의 Today, App 2개 탭으로 구성 

> Today탭 
<p>
<img width="220" alt="스크린샷 2022-04-24 오후 5 57 29" src="https://user-images.githubusercontent.com/75043852/164969185-b7c7643c-9ef8-4d78-8198-2e473b7f0b84.png">
<img width="220" alt="스크린샷 2022-04-24 오후 5 58 21" src="https://user-images.githubusercontent.com/75043852/164969190-e927059b-b819-4fa3-85cd-499d6f614770.png">
<img width="220" alt="스크린샷 2022-04-24 오후 5 58 36" src="https://user-images.githubusercontent.com/75043852/164969192-7ec2a77d-5b8e-4d9c-b05e-02031aefd5ec.png">
<img width="220" alt="스크린샷 2022-04-24 오후 5 58 36" src="https://user-images.githubusercontent.com/75043852/164969208-2703843f-779d-487e-9c8b-b58147e29373.png">
</p>

> App탭 
<p>
  <img width="220" alt="스크린샷 2022-04-24 오후 5 59 06" src="https://user-images.githubusercontent.com/75043852/164969223-854bdbd5-5d58-4f71-b9a5-c862afd0a8a6.png">
<img width="220" alt="스크린샷 2022-04-24 오후 5 59 33" src="https://user-images.githubusercontent.com/75043852/164969224-89246c1c-6456-44ae-9aed-1f50857bd046.png">
</p>

> ## 2.1 UITabBarController 

UITabBarController는 기본적으로 viewControllers라는 프로퍼티를 가지고있고, 탭을 구성할 ViewController들을 
* viewControllers = [UIViewController1, UIViewController2]
와 같이 넣어주면 된다. 해당 갯수만큼 Tab에 버튼이 만들어진다.

TabBarController에 등록된 각 viewController가 Tab에서 보여질 모습은
* viewController.tabBarItem = UITabBarItem(title:, image:,tag:)
로 설정해줄 수 있다.

## 2.2. 투데이 Tab

> 2.2.1 UICollectionView는 언제나 layout이 필요하다.
* UITableView와 같이 DelegateFlowLayout, DataSource 프로토콜을 구현해주어야한다. 
<img width="623" alt="스크린샷 2022-04-24 오후 6 00 31" src="https://user-images.githubusercontent.com/75043852/164968749-32b84027-82b8-438b-a89b-0f89716eb8a4.png">

> 2.2.2 CollectionViewCell Reuse
Cell Reuse는 collectionView.register(Cell클래스.self, forCellWithReuseIdentifier:"이름")으로 등록 후,
DataSource의 cellForItemAt 메서드에 "이름"을 통해 등록된 Cell객체를 메모리 상에서 Reuse하는 것이다.
이 과정에서 Optional Binding을 해주었다.

> 2.2.3 CollectionView Header
UICollectionViewDelegate프로토콜의 viewForSupplementaryElementOfKind메서드를 구현하고, Optional Binding으로 작성한 View가 Header위치에 들어갈 수 있도록 해주었다.
<img width="810" alt="스크린샷 2022-04-24 오후 6 03 24" src="https://user-images.githubusercontent.com/75043852/164968855-71b39973-2509-4d9c-a386-114f8d51a222.png">

> 2.2.4 Data Fetch
미리 만들어놓은 Today 탭에 필요한 Today구조체와 해당 구조체에 들어갈 내용들을 담고있는 plist파일을 사용하여 Decode한 data를 사용 
<img width="732" alt="스크린샷 2022-04-24 오후 6 19 09" src="https://user-images.githubusercontent.com/75043852/164969434-c3c6b95b-26d6-49f1-98ff-fbe42722e458.png">

> UIActivityController ( Share Sheet )
공유버튼 클릭 시 어떤 content를 어디로 share할지 선택할 수 있도록 UIButton에 UIActivityController를 addTarget해주었다.
![IMG_16A272B6D906-1](https://user-images.githubusercontent.com/75043852/164970584-a45eb671-2f52-4e89-82ff-cd52757b2d20.jpeg)


## 2.3. 앱 Tab
미리 만들어둔 Plist 파일과 Feature, RankingFeature 구조체를 사용해 데이터를 받아와 화면에 뿌려주는 방식 ( 아래 )은 Today탭과 동일하다.
<img width="743" alt="스크린샷 2022-04-24 오후 8 10 35" src="https://user-images.githubusercontent.com/75043852/164973602-f691de34-b045-4c52-9fa7-cd1f8a46478a.png">
특이점 몇가지만 정리해보았다. 

> 2.3.1 UIScrollView와 UIView
 UIScrollView 내부에 다른 컴포넌트들을 배치하려면, 이들을 넣어줄 contentView가 있어야하므로, UIView를 SnapKit을 이용하여 UIScrollView 내부에 같은 크기로 맞춰주었다.
 <img width="586" alt="스크린샷 2022-04-24 오후 6 31 24" src="https://user-images.githubusercontent.com/75043852/164969887-bf97aa94-7f14-4bdb-9543-afc9ed708521.png">
 위와 같이 width를 scrollView와 같게 해주면, 자동으로 상하스크롤이 된다. ( height를 고정하면 좌우스크롤 )
 
 > 2.3.2 상단의 FeatureSection의 가로 Scroll CollectionView
  - 1. collectionView는 언제나 Layout을 필요로하기 때문에, layout내부에 scrollDirection을 horizontal로 설정해주었다.
 <img width="315" alt="스크린샷 2022-04-24 오후 8 12 25" src="https://user-images.githubusercontent.com/75043852/164973665-dfac564b-717a-42ac-a048-e86531a567fd.png">
 - 1. 가로 스크롤 item단위로 스크롤이 예쁘게 진행되도록 아래와 같이 설정해주었다.
<img width="311" alt="스크린샷 2022-04-24 오후 8 13 27" src="https://user-images.githubusercontent.com/75043852/164973703-74f97ac5-fab9-4ea8-850a-68b1952987c1.png">

> 2.3.3 가로 스크롤 CollectionView에서 한 눈에 보여지는 cell의 갯수 조절하기 
 - 1. 해당 collectionView에 등록한 cell의 높이를 고정시켜준다 ( ex. 70)
 <img width="518" alt="스크린샷 2022-04-24 오후 8 16 55" src="https://user-images.githubusercontent.com/75043852/164973823-f23252c3-1650-42a6-a5a5-f0093cba40f0.png">
 
 - 2. UICollectionViewDelegateFlowLayout 프로토콜에서 sizeForItemAt메서드를 구현하며 height를 cell의 클래스에 설정된 대로  적용해준다

<img width="848" alt="스크린샷 2022-04-24 오후 8 17 28" src="https://user-images.githubusercontent.com/75043852/164973837-cb823f6a-9b57-4640-948c-ebfa7609932c.png">

- 3. collectionView의 높이를 autolayout에서 cell * 3의 height만큼 적용해주면, 3개까지만 보여지게 된다. ( 그 뒤로는 가로 스크롤 하며 볼 수 있다.)
<img width="512" alt="스크린샷 2022-04-24 오후 8 18 11" src="https://user-images.githubusercontent.com/75043852/164973861-c6ef39a5-0b3f-436a-9036-2c4847932478.png">

 

# 3. 지하철 역 검색 앱 

> 1. UISearchController 사용 ( UINavigationItem으로 사용! )
>> UISearchController 내부으 UISearchBar를 이용해 검색 
UISearchController()를 생성하여 navigationItem.searchColtroller = searchController로 enbedded해주면 된다 .

> 2. UIRefreshControl로 reload()가 가능하 하였다.

# 4. 인스타그램 UI 샘플 앱 

