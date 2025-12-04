import 'dart:developer';
import 'package:api_ui/api_1/api.dart';
import 'package:api_ui/api_1/database.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ApiDataScreen extends StatefulWidget {
  const ApiDataScreen({super.key});
  @override
  State<ApiDataScreen> createState() => _ApiDataScreenState();
}

class _ApiDataScreenState extends State<ApiDataScreen> {
  bool isloading = true;
  List qdata = [];
  loaddata() async {
    isloading = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 3));
    var apiResult = await Api().getDataApi();
    qdata = apiResult['data'];
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8EBF0),
      appBar: AppBar(
        backgroundColor: Color(0xff3DA978),
        centerTitle: true,
        title: Text(
          "Motivation Quotes",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              loaddata();
            },
            child: Icon(Icons.refresh, color: Colors.white),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: isloading == true
          ? Center(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) => SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 100.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Card(
                      child: SizedBox(
                        height: 100,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : qdata.isEmpty
          ? Center(child: Text("No Data Found"))
          : Column(
              children: [
                Padding(

                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                      hintText: "Search authors and quotes...",
                      hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(

                  child: ListView.builder(
                    itemCount: qdata.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Card(
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 14,
                          ),
                          child: Row(
                            spacing: 6,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                height: 76,
                                width: 67,
                                image: AssetImage("assets/fgiuyefs.png"),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${qdata[index]["quote"]}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "${qdata[index]["author"]}",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
