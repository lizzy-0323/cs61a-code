# tree abstraction

def tree(label,branches=[]):
    for branch in branches:
       assert is_tree(branch),"branches must be trees"
    # 这里label必须加[],否则就会把label加入到branches的列表中
    return [label] +list(branches)   

def is_tree(tree):
    if type(tree)!=list or len(tree)<1:
        return False
    for branch in branches(tree):
        if not is_tree(branch):
            return False
    return True
def branches(tree):
    return tree[1:]
def label(tree):
    return tree[0]
def is_leaf(tree):
    return not branches




