package kr.or.ddit.common.board.postboard.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.common.board.postboard.dao.IBoardDAO;
import kr.or.ddit.common.board.postboard.dao.IPdsDAO;
import kr.or.ddit.vo.PagingInfoVO;
import kr.or.ddit.vo.ReviewVO;
import kr.or.ddit.vo.Review_FileVO;

@Service
public class BoardServiceImpl implements IBoardService {
	@Inject
	IBoardDAO boardDAO;
	@Inject
	IPdsDAO pdsDAO;

	
//	@Value("#{appInfo.pdsPath}")
//	File saveFolder;
	
//	@PostConstruct
//	public void init(){
//		if(!saveFolder.exists()) saveFolder.mkdirs();
//	}
	
	private int processFiles(ReviewVO board) {
		int rowCnt = 0;
		List<Review_FileVO> pdsList = board.getPdsList();
		
		if(pdsList!=null && pdsList.size() > 0) {
			
			rowCnt += pdsDAO.insertPdsList(board);
			for(Review_FileVO pds : pdsList) {
				try(
						InputStream in = pds.getItem().getInputStream();	
				){
//					FileUtils.copyInputStreamToFile(in, 
//							new File(saveFolder, pds.getReview_savename()));
				}catch (IOException e) {
				}
			}
		}
		
		Long[] delFiles = board.getDelFiles();
		if(delFiles!=null) {
			
			String[] saveNames = new String[delFiles.length];
			for(int idx=0; idx<delFiles.length; idx++) {
				saveNames[idx] = pdsDAO.selectPds(delFiles[idx])
									   .getReview_savename(); 
			}
			rowCnt += pdsDAO.deletePdses(board);

			for(String savename : saveNames) {
//				FileUtils.deleteQuietly(new File(saveFolder, savename));
			}
			
		}
		
		return rowCnt;
	}
	
	
	@Override
	public ServiceResult createBoard(ReviewVO board) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long retriveBoardCount(PagingInfoVO<ReviewVO> pagingVO) {
		return boardDAO.selectTotalRecord(pagingVO);
	}

	@Override
	public List<ReviewVO> retriveBoardList(PagingInfoVO<ReviewVO> pagingVO) {
		return boardDAO.selectBoardList(pagingVO);	
	}

	@Override
	public ReviewVO retriveBoard(long review_no) {
		ReviewVO review = boardDAO.selectBoard(review_no);
		if(review==null) {
//			throw new BoardException(review_no+"에 해당하는 게시글이 없음");
		}
		boardDAO.incrementHit(review_no);
		return review;
	}

	@Override
	public ServiceResult modifyBoard(ReviewVO board) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult removeBoard(ReviewVO board) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Review_FileVO downloadPds(long review_file_no) {
		Review_FileVO pds = pdsDAO.selectPds(review_file_no);
		if(pds==null) {
//			throw new BoardException(review_file_no+"에 해당 파일이 없음.");
		}
		return pds;
	}
	
	
	


}










