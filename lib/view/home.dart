import 'package:aspod/bloc/data_bloc/databloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String date = "2017-07-10";

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    loadData();
    super.initState();
  }


  loadData() {
    context.read<DatablocBloc>().add(DataSubmitEvent(date: date));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DatablocBloc, DatablocState>(builder: (context, state) {
        if (state is DataFetched) {
          
          
          
          return Container(
            child: Stack(children: [
              state.dataModel.mediaType == "image"
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:NetworkImage(state.dataModel.url),
                          // FadeInImage.assetNetwork(placeholder: placeholder, image: image)
                          
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.blueAccent,
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getDatePicker(),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    state.dataModel.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    state.dataModel.explanation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.0,color: Colors.white),
                  ),
                  Text(
                    state.dataModel.date,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ]),
          );
        } 
        
        
        else if (state is Failed) {
          return Container(
            child: Center(
              child: Text(state.message),
            ),
          );
        }


        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }

  Widget getDatePicker() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "${selectedDate.toLocal()}".split(' ')[0],
          style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () => _selectDate(context), // Refer step 3
              child: Text(
                'Select date',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              color: Colors.yellow,
            ),
            SizedBox(
              width: 50.0,
            ),
            RaisedButton(
              onPressed: () {
                context.read<DatablocBloc>().add(DataSubmitEvent(
                    date: "${selectedDate.toLocal()}".split(' ')[0]));
              }, // Refer step 3
              child: Text(
                'Submit',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              color: Colors.yellow,
            ),
          ],
        ),
      ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
