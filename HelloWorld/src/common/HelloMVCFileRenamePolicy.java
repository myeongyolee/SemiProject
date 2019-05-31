package common;

import java.io.File;
import java.io.IOException;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class HelloMVCFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		File newFile = null;
		
		do {
			
			//확장자
			String oldName = oldFile.getName(); //사용자가 전송한 파일이름
			String ext = "";
			int dot = oldName.lastIndexOf(".");
			if(dot > -1) {
				ext = oldName.substring(dot);
			}
			
			//새파일명
			String newName = oldFile.getName() + "가나다" + ext;
			
			//실제파일객체 새로생성
			newFile = new File(oldFile.getParent(), newName);
			
		}while(!creatNewFile(newFile));
		
		return newFile;
	}

	private boolean creatNewFile(File newFile) {
		//기존에 있는 파일과 같은 이름의 파일이 있으면, 파일을 생성하지않고 false를 리턴
		//그렇지 않으면, 파일을 생성하고 true를 리턴
		try {
			return newFile.createNewFile();
		} catch (IOException e) {
			return false;
		}
	}

}
