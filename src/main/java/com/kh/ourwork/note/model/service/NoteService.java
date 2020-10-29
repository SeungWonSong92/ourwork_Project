package com.kh.ourwork.note.model.service;

import java.util.ArrayList;

import com.kh.ourwork.note.model.vo.Search;
import com.kh.ourwork.common.PageInfo;
import com.kh.ourwork.employee.model.vo.Employee;
import com.kh.ourwork.note.model.vo.Note;
import com.kh.ourwork.note.model.vo.NoteReceiver;

public interface NoteService {

	int selectInboxListCount(Employee m);

	ArrayList<Note> selectInboxList(PageInfo pi, Employee m);

	Note selectNote(int ntId);
	
	int addReceiveDate(int ntId);


	int selectAllMemberCount();
	
	ArrayList<NoteReceiver> selectAllMember(PageInfo pi);
	
	int receiverSearchCount(Search search);

	ArrayList<NoteReceiver> receiverSearch(Search search, PageInfo pi);

	NoteReceiver selectReceiver(String eId);

	int sendNote(Note nt);

	int ntInDelete(int ntId);

	int selectOutboxListCount(Employee m);

	ArrayList<Note> selectOutboxList(PageInfo pi, Employee m);

	int ntOutDelete(int ntId);

	int inboxSearchListCount(Search search);

	ArrayList<Note> inboxSearchList(PageInfo pi, Search search);

	int returnNote(int ntId);

	int noteInSave(int ntId);

	int noteOutSave(int ntId);

	int selectSaveListCount(Employee loginUser);

	ArrayList<Note> selectSaveList(PageInfo pi, Employee loginUser);

	int outboxSearchListCount(Search search);

	ArrayList<Note> outboxSearchList(PageInfo pi, Search search);

	int saveSearchListCount(Search search);

	ArrayList<Note> saveSearchList(PageInfo pi, Search search);

}
