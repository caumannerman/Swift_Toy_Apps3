# Swift_Toy_Apps3
Swift와 OpenAPI를 사용한 간단한 프로젝트 7가지

# 1. 자산관리 App

# 2. AppStore 앱 

> ## 2.1 UITabBarController 

UITabBarController는 기본적으로 viewControllers라는 프로퍼티를 가지고있고, 탭을 구성할 ViewController들을 
* viewControllers = [UIViewController1, UIViewController2]
와 같이 넣어주면 된다.

TabBarController에 등록된 각 viewController가 Tab에서 보여질 모습은
* viewController.tabBarItem = UITabBarItem(title:, image:,tag:)
로 설정해줄 수 있다.

> ## 2.2. UICollectionView

UICollectionView는 언제나 layout이 필요하다.
* UITableView와 같이 DelegateFlowLayout, DataSource 프로토콜을 구현해주어야한다. 

Cell Reuse는 collectionView.register(Cell클래스.self, forCellWithReuseIdentifier:"이름")으로 등록 후,
DataSource의 cellForItemAt 메서드에 "이름"을 통해 등록된 Cell객체를 메모리 상에서 Reuse하는 것이다.

# 3. 지하철 역 검색 앱 

> 1. UISearchController 사용 ( UINavigationItem으로 사용! )
>> UISearchController 내부으 UISearchBar를 이용해 검색 
UISearchController()를 생성하여 navigationItem.searchColtroller = searchController로 enbedded해주면 된다 .

> 2. UIRefreshControl로 reload()가 가능하 하였다.


