//
//  NoteEditorTests.swift
//  CatatanMuslimTests
//
//  Created by PondokiOS on 11/21/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import XCTest
@testable import CatatanMuslim

class NoteEditorTests: XCTestCase {
    private var title: String { return "Belajar Al Quran" }
    private var privacy: Privacy { return Privacy.default }
    private var content: String { return  "<em>Belajar Al Kahfi</em> di hari Jumat" }
    
    private var contentHTML: String {
        return "<h1>\(title)</h1>\(content)"
    }
    
    private var noteViewModel: NoteViewModel!
    private lazy var noteEditableField = Note.EditableField(
        title: title,
        privacy: privacy,
        content: content
    )
    override func setUp() {
        super.setUp()
        noteViewModel = NoteViewModel(
            noteEditableField: noteEditableField
        )
    }
    
    override func tearDown() {
        noteViewModel = nil
        super.tearDown()
    }
    
    func testTitleToHeading() {
        guard let viewModelContent = noteViewModel.content else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(
            viewModelContent,
            contentHTML
        )
    }
    
    func testEditableFieldFromHTML() {
        let title = UUID().uuidString
        let content = UUID().uuidString
        noteViewModel.content = "<h1>\(title)</h1>\(content)"
        guard let editableField = noteViewModel.noteEditableField else {
            XCTFail()
            return
        }
        
        let editedTitle = editableField.title
        let editedContent = editableField.content
        
        XCTAssertEqual(
            title,
            editedTitle
        )
        
        XCTAssertEqual(
            content,
            editedContent
        )
    }
    
    func testEditableFieldShouldNil() {
        let title = UUID().uuidString
        let content = UUID().uuidString
        noteViewModel.content = "<h2>\(title)</h2>\(content)"
        guard noteViewModel.noteEditableField != nil else {
            return
        }
        XCTFail()
    }
    
}
