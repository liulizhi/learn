CREATE TABLE {$NAMESPACE}_audit.audit_transaction_comment (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  phid VARCHAR(64) COLLATE utf8_bin NOT NULL,
  transactionPHID VARCHAR(64) COLLATE utf8_bin,
  authorPHID VARCHAR(64) COLLATE utf8_bin NOT NULL,
  viewPolicy VARCHAR(64) COLLATE utf8_bin NOT NULL,
  editPolicy VARCHAR(64) COLLATE utf8_bin NOT NULL,
  commentVersion INT UNSIGNED NOT NULL,
  content longtext COLLATE utf8_bin NOT NULL,
  contentSource longtext COLLATE utf8_bin NOT NULL,
  isDeleted BOOL NOT NULL,
  dateCreated INT UNSIGNED NOT NULL,
  dateModified INT UNSIGNED NOT NULL,
  commitPHID VARCHAR(64) COLLATE utf8_bin,
  pathID INT UNSIGNED,
  isNewFile BOOL NOT NULL,
  lineNumber INT UNSIGNED NOT NULL,
  lineLength INT UNSIGNED NOT NULL,
  fixedState VARCHAR(12) COLLATE utf8_bin,
  hasReplies BOOL NOT NULL,
  replyToCommentPHID VARCHAR(64) COLLATE utf8_bin,
  legacyCommentID INT UNSIGNED,
  UNIQUE KEY `key_phid` (phid),
  UNIQUE KEY `key_version` (transactionPHID, commentVersion),
  KEY `key_path` (pathID),
  KEY `key_draft` (authorPHID, transactionPHID),
  KEY `key_commit` (commitPHID),
  KEY `key_legacy` (legacyCommentID)
) ENGINE=InnoDB, COLLATE utf8_general_ci;
