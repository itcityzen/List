import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class calendar extends StatelessWidget {
  calendar({super.key});
  DateTime Today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[50],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 150,
              color: Color.fromARGB(255, 243, 196, 251),
              child: EasyDateTimeLine(
                activeColor: Colors.cyan,
                initialDate: DateTime.now(),
        
                timeLineProps: EasyTimeLineProps(
                  backgroundColor: Color.fromARGB(255, 243, 196, 251),
                  vPadding: 15,
                  separatorPadding:Checkbox.width,
                ),
                onDateChange: (selectedDay) {},
                
                
                headerProps: EasyHeaderProps(showMonthPicker: false,
                    showHeader: true,
                    centerHeader: true,
                    monthPickerType: MonthPickerType.dropDown,
                    dateFormatter: DateFormatter.fullDateDayAsStrMY(),),
        
        
        
        
                dayProps: EasyDayProps(
                    inactiveDayStyle: DayStyle(
                        dayStrStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold ),
                        dayNumStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 253, 203, 255),
                            borderRadius: BorderRadius.all(Radius.circular(25)))),
                    dayStructure: DayStructure.dayStrDayNum,


                    activeDayStyle: DayStyle(
                        dayStrStyle: TextStyle(color: Colors.black),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.purple, Colors.purpleAccent])))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
