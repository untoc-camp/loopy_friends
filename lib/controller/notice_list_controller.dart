import 'package:get/get.dart';
import 'package:loopy_friends/model/notice_list_model.dart';

class NoticeController extends GetxController {
  var totalCouncilData = <Notice>[].obs;
  var departmentCouncilData = <Notice>[].obs;
  var departmentNoticeData = <Notice>[].obs;
  var applyRecruitData = <Notice>[].obs;

  @override
  void onInit() {
    super.onInit();

    totalCouncilData.addAll([
      Notice(title: '총학생회 공지1', date: '2024.06.27', detail: '총학생회 공지1 내용입니다. 많관부 !'),
      Notice(title: '총학생회 공지2', date: '2024.06.28', detail: '총학생회 공지2 내용입니다. 많관부 !'),
      Notice(title: '총학생회 공지3', date: '2024.06.29', detail: '총학생회 공지3 내용입니다. 많관부 !'),
      Notice(title: '총학생회 공지4', date: '2024.06.30', detail: '총학생회 공지4 내용입니다. 많관부 !'),
    ]);

    departmentCouncilData.addAll([
      Notice(title: '학생회 공지1', date: '2024.06.27', detail: '학생회 공지1 내용입니다. 많관부 !'),
      Notice(title: '학생회 공지2', date: '2024.06.28', detail: '학생회 공지2 내용입니다. 많관부 !'),
      Notice(title: '학생회 공지3', date: '2024.06.29', detail: '학생회 공지3 내용입니다. 많관부 !'),
      Notice(title: '학생회 공지4', date: '2024.06.30', detail: '학생회 공지4 내용입니다. 많관부 !')
    ]);

    departmentNoticeData.addAll([
      Notice(title: '학과 공지1', date: '2024.06.27', detail: '학과 공지1 내용입니다. 많관부 !'),
      Notice(title: '학과 공지2', date: '2024.06.28', detail: '학과 공지2 내용입니다. 많관부 !'),
      Notice(title: '학과 공지3', date: '2024.06.29', detail: '학과 공지3 내용입니다. 많관부 !'),
      Notice(title: '학과 공지4', date: '2024.06.30', detail: '학과 공지4 내용입니다. 많관부 !')
    ]);

    applyRecruitData.addAll([
      Notice(title: '모집공고1', date: '2024.06.27', detail: '모집공고1 내용입니다. 많관부 !'),
      Notice(title: '모집공고2', date: '2024.06.28', detail: '모집공고2 내용입니다. 많관부 !'),
      Notice(title: '모집공고3', date: '2024.06.29', detail: '모집공고3 내용입니다. 많관부 !'),
      Notice(title: '모집공고4', date: '2024.06.30', detail: '모집공고4 내용입니다. 많관부 !'),
    ]);
  }
}
