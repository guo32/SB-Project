package dao;

import java.util.ArrayList;

import dto.Bakery;

public class BakeryRepository {
	
	private ArrayList<Bakery> listOfBakerys = new ArrayList<Bakery>();

	public BakeryRepository() {
		Bakery cakeLovers = new Bakery("bakery1234", "����ũ ������", "��õ �߱� �������� 107 ����ũ ������");
		cakeLovers.setBakeryNumber("0507-1386-6033");
		cakeLovers.setOpen("AM 11:00");
		cakeLovers.setClose("PM 9:00");
		cakeLovers.setFilename1("bakery1234a.jpg");
		cakeLovers.setFilename2("bakery1234b.jpg");
		cakeLovers.setFilename3("bakery1234c.jpg");
		
		Bakery coogeeSongrim = new Bakery("bakery1235", "����Ŀ�� �۸���", "��õ ���� �۸��� 119-1 ����Ŀ�Ǽ۸���");
		coogeeSongrim.setBakeryNumber("070-8887-1078");
		coogeeSongrim.setOpen("AM 8:30");
		coogeeSongrim.setClose("PM 8:00");
		coogeeSongrim.setFilename1("bakery1235a.jpg");
		coogeeSongrim.setFilename2("bakery1235b.jpg");
		coogeeSongrim.setFilename3("bakery1235c.jpg");
		
		Bakery witchrong = new Bakery("bakery1236", "��ġ��", "��õ �߱� ������67���� 39 1�� ��ġ��");
		witchrong.setBakeryNumber("010-5152-6636");
		witchrong.setOpen("AM 11:00");
		witchrong.setClose("PM 8:00");
		witchrong.setFilename1("bakery1236a.jpg");
		witchrong.setFilename2("bakery1236b.jpg");
		witchrong.setFilename3("bakery1236c.jpg");
		
		listOfBakerys.add(cakeLovers);
		listOfBakerys.add(coogeeSongrim);
		listOfBakerys.add(witchrong);
	}
	
	public ArrayList<Bakery> getAllBakerys() {
		return listOfBakerys;
	}
	
	// ����Ŀ�� ���̵� ã��
	public Bakery getBakeryById(String bakeryId) {
		Bakery bakeryById = null;
		
		for(int i = 0; i < listOfBakerys.size(); i++) {
			Bakery bakery = listOfBakerys.get(i);
			if(bakery != null && bakery.getBakeryId() != null && bakery.getBakeryId().equals(bakeryId)) {
				bakeryById = bakery;
				break;
			}
		}
		
		return bakeryById;
	}
	
}
