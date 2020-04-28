part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  _HomeMobile(this.viewModel);

  ScrollController scrollController = ScrollController();
  List<Data> dataList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vu Mobile'),
          backgroundColor: Colors.black,
        ),
        body: viewModel.busy == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.count(
                crossAxisCount: 2,
                controller: scrollController,
                children: List.generate(
                    this.viewModel.dataModel.dataList.length, (index) {
                  dataList = this.viewModel.dataModel.dataList;
                  return InkWell(
                    child: Hero(
                      tag: 'image - ${dataList[index].id}',
                      child: Image.network(dataList[index].avatar),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ImageScreen(dataList[index]);
                      }));
                    },
                  );
                })));
  }
}

class ImageScreen extends StatelessWidget{
  Data data;
  ImageScreen(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'image - $data.id',
            child: Image(image: NetworkImage(data.avatar),)
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
