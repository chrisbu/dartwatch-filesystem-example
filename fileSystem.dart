#library("fileSystem");

void main() {
	final String filename = "myFile.txt";

	if (FileUtil.fileExists(filename)) {
		print("File already exists, but we'll overwrite it");
	}

	File writableFile = new File(filename, true);

	writableFile.writeString("Hello World\nGoodbye World");
	writableFile.close();
	print("file ${filename} written and closed");

	File readableFile = new File(filename, false);
	int fileLength = readableFile.length;

	//create a buffer big engough for the file
	List<int> buffer = new List<int>(fileLength);
	print("Opened ${filename} for reading, length= ${fileLength}");

	//read the contents into the buffer from offset zero for the length of the file
	readableFile.readList(buffer, 0, fileLength);

	//convert the buffer back into a string
	String s = new String.fromCharCodes(buffer);
	//output the contents
	print("${filename} contents:\n${s}");

}