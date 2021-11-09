// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract Board {
    uint public post_count;

    struct Post {
        address poster;
        string content;
    }

    mapping(uint => Post) public posts;

    function addPost(string calldata content) public {
        post_count++;
        
        Post memory newPost = Post(msg.sender, content);
        posts[post_count] = newPost;
    }
}