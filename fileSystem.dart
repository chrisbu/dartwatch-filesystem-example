#library("fileSystem");

void main() {
	final String filename = "myFile.txt";

	File writableFile = new File(filename);

	if (writableFile.existsSync()) {
		print("File already exists, but we'll overwrite it");
	}
	else {
		print("File doesn't exist - we'll create it");	
		writableFile.createSync(); //not currently implemented in trunk - manually create the file!
		print("Created");	
	}

	writableFile.openSync(true);
	writableFile.writeStringSync("Hello World\nGoodbye World");

	print("file ${filename} written ");
	writableFile.closeSync();
	print("file ${filename} closed");


	File readableFile = new File(filename);
	readableFile.openSync(false);
	int fileLength = readableFile.lengthSync();

	//create a buffer big engough for the file
	List<int> buffer = new List<int>(fileLength); 		
	print("Opened ${filename} for reading, length= ${fileLength}");

	//read the contents into the buffer from offset zero for the length of the file
	readableFile.readListSync(buffer, 0, fileLength);
	readableFile.closeSync();

	//convert the buffer back into a string
	String s = new String.fromCharCodes(buffer);
	//output the contents
	print("${filename} contents:\n${s}");

}
