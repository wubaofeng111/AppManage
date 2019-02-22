// 二叉树 创建，遍历
//1 5 10 13 17 18 19 20 1

#include <iostream>
#include <vector>

using namespace std;

typedef vector<int> IntArray;
IntArray arr;

typedef struct SeTreeNode
{
   struct SeTreeNode *Left;
    struct SeTreeNode *Right;
    int Data;
}SeTreeNode;



SeTreeNode *CreateTreeNode(int data)
{
    SeTreeNode *node = (SeTreeNode*)malloc(sizeof(SeTreeNode));
    node->Data = data;
    node->Left = NULL;
    node->Right = NULL;
    return node;
}

void MiddlePrint(SeTreeNode *rootNode)
{
    if (rootNode->Left != NULL) {
        MiddlePrint(rootNode->Left);
    }
    
    printf("%d\n",rootNode->Data);
    
    if(rootNode->Right != NULL){
        MiddlePrint(rootNode->Right);
    }
    
}

void FrontPrint(SeTreeNode *rootNode)
{
    printf("%d\n",rootNode->Data);
    
    if (rootNode->Left != NULL) {
        FrontPrint(rootNode->Left);
    }
    
    if(rootNode->Right != NULL){
        FrontPrint(rootNode->Right);
    }
}

void CreateFullTree(SeTreeNode *rootNode)
{
    int size = (int)arr.size();
    if (size > 0) {
        int num = arr.at(size-1);
        arr.pop_back();
        rootNode = CreateTreeNode(num);
        rootNode->Data = num;
        
        CreateFullTree(rootNode->Left);
        CreateFullTree(rootNode->Right);
    }else{
        return;
    }
    
}


void InitTree(SeTreeNode *rootNode)
{
    int data;
    
    char tag[5];
        // 根节点
        // 开始左子树
    memset(tag, 0, 5);
        printf("%d输入左子树是否为空,0 空 1 非空\n",rootNode->Data);
//    cin>>tag;
    printf("tag=%s",tag);
    fflush(stdin);
    scanf("%s",tag);
    printf("lefttag=%s\n",tag);
        if(tag[0] == '0')
        {
            printf("左子树为空，返回\n");
        }else if(tag[0] == '1'){
            
            printf("%d左子树非空,输入左子树\n",rootNode->Data);
            cin>>data;
            rootNode->Left = CreateTreeNode(data);
            InitTree(rootNode->Left);
            
        }
        // 开始右子树
        printf("%d输入右子树是否为空,0 空 1 非空\n",rootNode->Data);
        memset(tag, 0, 5);
    printf("tag=%s",tag);
//        cin>>tag;
    fflush(stdin);
    scanf("%s",tag);
        printf("righttag=%s\n",tag);
        if(tag[0] == '0')
        {
            printf("右子树为空，返回\n");
        }else if(tag[0] == '1'){
            
            printf("%d右子树非空,输入左子树\n",rootNode->Data);
            cin>>data;
            rootNode->Right = CreateTreeNode(data);
            InitTree(rootNode->Right);
            
        }
    
}


void MidSwap(SeTreeNode *rootNode)
{
    SeTreeNode *tmpNode = rootNode->Right;
    rootNode->Right     = rootNode->Left;
    rootNode->Left      = tmpNode;
    
    if (rootNode->Right != NULL) {
        MidSwap(rootNode->Right);
    }
    if (rootNode->Left != NULL) {
        MidSwap(rootNode->Left);
    }

}


typedef struct NoData{
    char type;
    int  data;
}NoData;
typedef vector<NoData> Data;


int main(int argc, const char * argv[]) {

    
    SeTreeNode *node = CreateTreeNode(8);
    InitTree(node);
    
    MidSwap(node);
    
    printf("打印二叉树!");
    MiddlePrint(node);
    printf("先序遍历!");
    FrontPrint(node);
    
    printf("1");
  
    return 0;
}
