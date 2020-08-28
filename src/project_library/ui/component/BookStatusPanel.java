package project_library.ui.component;

import java.awt.Font;
import java.awt.GridLayout;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.border.TitledBorder;

import project_library.service.BookStatusManagementService;

@SuppressWarnings("serial")
public class BookStatusPanel extends JPanel {
	private BookStatusManagementService bService;

	public BookStatusPanel() {
		setBorder(new TitledBorder(null, "[ 도서 현황 ]", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		setLayout(new GridLayout(0, 2, 20, 10));
		
		JLabel lblTBook = new JLabel("총 보유 권수");
		lblTBook.setHorizontalAlignment(SwingConstants.CENTER);
		lblTBook.setFont(new Font("맑은 고딕", Font.BOLD, 14));
		add(lblTBook);
		
		JTextField tfToBook = new JTextField();
		tfToBook.setFont(new Font("맑은 고딕", Font.BOLD, 14));
		add(tfToBook);
		tfToBook.setColumns(10);
		tfToBook.setText(bService.selectTotalBook() + "권");

		JLabel lblOBook = new JLabel("총 연체 권수");
		lblOBook.setHorizontalAlignment(SwingConstants.CENTER);
		lblOBook.setFont(new Font("맑은 고딕", Font.BOLD, 14));
		add(lblOBook);
		
		bService = new BookStatusManagementService();
		
		JTextField tfOvBook = new JTextField();
		tfOvBook.setFont(new Font("맑은 고딕", Font.BOLD, 14));
		add(tfOvBook);
		tfOvBook.setColumns(10);
		//bService.selectTotalBook();
		
		JLabel lblRBook = new JLabel("총 대여 권수");
		lblRBook.setHorizontalAlignment(SwingConstants.CENTER);
		lblRBook.setFont(new Font("맑은 고딕", Font.BOLD, 14));
		add(lblRBook);
		
		JTextField tfReBook = new JTextField();
		tfReBook.setFont(new Font("맑은 고딕", Font.BOLD, 14));
		add(tfReBook);
		tfReBook.setColumns(10);
	}
	
	/*	// 수정 불가능
		public void setEditalbeFalseTf() {
			tfTBook.setEditable(false);
			tfOBook.setEditable(false);
			tfRBook.setEditable(false);
		}*/

}
