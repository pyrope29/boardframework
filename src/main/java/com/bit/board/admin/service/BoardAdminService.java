package com.bit.board.admin.service;

import java.util.List;

import com.bit.board.admin.model.BoardListDto;
import com.bit.board.admin.model.BoardTypeDto;
import com.bit.board.admin.model.CategoryDto;

public interface BoardAdminService {

	List<BoardListDto> getBoardMenu();
	
	List<CategoryDto> getCategory();
	void makeCategory(CategoryDto categoryDto);
	List<BoardTypeDto> getBoardType();
	void makeBoard(BoardListDto boardListDto);
	
}
