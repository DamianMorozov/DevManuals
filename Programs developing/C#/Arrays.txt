Arrays. Get length
------------------

// 1. For 1 dimensional array
int[] listItems = new int[] {2,4,8};
int length = listItems.Length;

// 2. For multidimensional array
var dimensions = listItems.Rank;
// To get the size of 1 dimension
if (dimensions == 1)
  int length =  listItems.GetLength(0);
else if (dimensions == 2)
{
  int length1 =  listItems.GetLength(0);
  int length2 =  listItems.GetLength(1);
}
